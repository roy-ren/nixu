export def start-ssh-agent [] {
  let ssh_output = (ssh-agent -s)
  let ssh_lines = ($ssh_output | lines)
  # 針對 `name=value; export name;` 格式解析
  let ssh_vars = ($ssh_lines | parse '{name}={value}; export {name};')

  # 如果成功 parse，就設置環境變數
  if ($ssh_vars | length) > 0 {
    let ssh_sock = ($ssh_vars | where name == 'SSH_AUTH_SOCK' | get 0.value)
    let ssh_pid  = ($ssh_vars | where name == 'SSH_AGENT_PID' | get 0.value)

    load-env {
      SSH_AUTH_SOCK: $ssh_sock
      SSH_AGENT_PID: $ssh_pid
    }

    # 加載私鑰（可選）
    let ssh_key_path = ($nu.home-path | path join ".ssh" "id_ed25519")
    if ($ssh_key_path | path exists) {
      ssh-add $ssh_key_path
    } else {
      print "❌ 未找到 SSH 私鑰"
    }
  } else {
    print "❌ ssh-agent 啟動失敗，未找到 SSH_AUTH_SOCK"
  }
}
