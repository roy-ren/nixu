def clearNvim [] {
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
}

# $PATH
def --env add-to-path [
  path_to_add: string,
  --home: string # 可选传入
] {
  let resolved_home = (if ($home | is-empty) { $env.HOME } else { $home })
  let full_path = ($resolved_home | path join $path_to_add)
  if not ($env.PATH | any {|p| $p == $full_path }) {
    $env.PATH = ($env.PATH | append $full_path)
  }
}
