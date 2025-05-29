export def debug-watch [
  --exts: string = 'dart,yaml,json'  # 要监听的扩展名
  --watch_dirs: list<string> = [
    'lib',
    'assets',
    '../../packages'
  ]  # 要监听的目录
  ...args  # 传给 flutter run 的额外参数
] {
  # 检查依赖命令
  let required_cmds = ['fvm', 'tmux', 'xargs']
  for cmd in $required_cmds {
    if (not (which $cmd | is-empty)) == false {
      print $"Error: command not found: ($cmd)"
      return
    }
  }

  # 检查是否在 tmux 中运行
  if ($env.TMUX? | is-empty) {
    print "⚠️  Not inside a tmux session. Please run this inside tmux."
    return
  }

  # 生成唯一 PID 文件路径（基于当前目录 hash）
  let dir_hash = (pwd | hash sha256 | str substring 0..8)
  let pid_path = $"/tmp/-debug-($dir_hash).pid"

  # 构造 flutter run 命令
  let flutter_cmd = (
    ['fvm', 'flutter', 'run'] ++ $args ++ [ $"--pid-file=($pid_path)" ]
    | str join ' '
  )

  # 启动 flutter
  tmux send-keys $flutter_cmd Enter

  # 启动监听器分屏
  tmux split-window -v

  # 构造监听命令
  let reload_cmd = $'if [ -f "($pid_path)" ]; then cat "($pid_path)" | xargs kill -s USR1; fi'

  let watch_args = ($watch_dirs | each { |dir| $"--watch ($dir)" } | str join ' ')
  let nodemon_cmd = $'npx -y nodemon ($watch_args) -e ($exts) -x "($reload_cmd)"'

  # 运行 nodemon
  tmux send-keys $nodemon_cmd Enter

  # 调整 tmux pane
  tmux resize-pane -y 5 -t 1
  tmux select-pane -t 0

  let watchings = ($watch_dirs | str join "\n📁")

  print $"==============\n✅ Debug-watch Started!\n✅ Pid file: ($pid_path)\n==============\n✅ watching👇👇👇\n--------------\n📁($watchings)\n=============="
}
