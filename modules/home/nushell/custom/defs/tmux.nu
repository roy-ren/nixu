def s [] {
  let selected = (sesh list --icons | fzf --ansi)
  sesh connect $selected
}
