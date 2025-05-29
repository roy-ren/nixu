# create new window run dart run build_runner watch
def w_drb_watching [
  --name: string
  --keys: string
] {
  let window_name = (tmux display-message -p '#W' | str trim)
  let resolved_name = if ($name | is-empty) { $window_name } else { $name }
  let name = $"[($resolved_name)] in Watching..."

  if $window_name != $name {
    tmux new-window -n $name
  }

  let keys = if ($keys | is-empty) { "drbw" } else { $keys }
  tmux send-keys $keys C-m
}
