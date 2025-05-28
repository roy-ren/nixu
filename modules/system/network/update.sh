#!/run/current-system/sw/bin/bash

# 配置路径
subscriptionFile="/home/roy/.config/ss/subscription.txt"
ssConfigFile="/etc/shadowsocks/config.json"

# local_port=${LOCAL_PORT:-1085}
timeout=${TIMEOUT:-300}

# 初始化 Shadowsocks 配置的 JSON 格式
init_ss_config() {
  # 创建一个空的 Shadowsocks 配置 JSON 对象
  con=$(jq -n \
    --arg local_address "127.0.0.1" \
    --arg local_port "1085" \
    '{
            "servers": [],
            "local_address": $local_address,
            "local_port": ($local_port | tonumber),
        }')
  echo "$con"
}

ss_config=$(init_ss_config)

# 插入一个新的 SS 配置到 servers 数组中
insert_ss_config() {
  # 将新的配置插入到现有的 ss_config 的 servers 数组中
  updated_config=$(echo "$ss_config" | jq --argjson new_ss_config "$1" '.servers += [$new_ss_config]')

  # 输出更新后的配置
  echo "$updated_config"
}

decode_base64() {
  case "$((${#1} % 4))" in
  2) echo "$1==" ;;
  3) echo "$1=" ;;
  *) echo "$1" ;;
  esac | tr '_-' '/+' | grep -o "^[a-zA-Z0-9+/=]*" | base64 -d
}

decode_ss() {
  IFS=:@\  read -r method password server server_port <<<"${1%%/?*}"

  # 创建 JSON 对象
  json=$(jq -n \
    --arg server "$server" \
    --arg server_port "$server_port" \
    --arg password "$password" \
    --arg timeout "$timeout" \
    --arg method "$method" \
    '{
            server: $server,
            server_port: ($server_port | tonumber),
            password: $password,
            timeout: ($timeout | tonumber),
            method: $method
        }')

  # 输出格式化后的 JSON
  echo "$json" | jq .

  # 保存 JSON 配置文件
  # conf=$(echo "ss-${server:-NoServer}-${server_port:-NoPort}.json" | tr "/ " _)
  # echo "$json" > "$conf"
  # echo "Configuration saved to $conf"
}

decode_vmess() {
  # 直接使用 jq 从 JSON 字符串中提取字段
  json=$(echo "$1" | jq -r \
    '. | {add, port, id, aid, net, type, tls, ps}')

  # 输出格式化后的 JSON
  echo "$json" | jq .

  # 保存 JSON 配置文件
  # conf=$(echo "v2ray-${add:-NoAdd}-${ps:-NoPs}.json" | tr "/ " _)
  # echo "$json" > "$conf"
  # echo "Configuration saved to $conf"
}

decode_link() {
  info=$(decode_base64 "${1#*://}")
  case "${1%%:*}" in
  ss)
    server=$(decode_ss "$info")
    ss_config=$(insert_ss_config "$server")
    ;;
  vmess) decode_vmess "$info" ;;
  esac
}

# 检查订阅文件是否存在
if [ ! -f "$subscriptionFile" ]; then
  echo "Error: Subscription file not found at $subscriptionFile"
  exit 1
fi

# 读取订阅地址
subscription_url=$(cat "$subscriptionFile")

# 检查订阅地址是否有效
if [ -z "$subscription_url" ]; then
  echo "Error: Subscription URL is empty or missing"
  exit 1
fi

# 使用 curl 获取订阅内容（Base64 编码）
base64_config=$(curl -s "$subscription_url")
if [ -z "$base64_config" ]; then
  echo "Error: Failed to fetch subscription content"
  exit 1
fi

# 解码 Base64 并提取 JSON 配置
decoded_config=$(echo "$base64_config" | base64 -d)

echo "$decoded_config" | while read -r line; do
  [[ -z "$line" ]] && continue
  decode_link "$line"
  echo "$ss_config" >$ssConfigFile
done
