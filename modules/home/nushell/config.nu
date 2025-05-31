source ($nu.default-config-dir | path join "custom/defs/normal.nu")
source ($nu.default-config-dir | path join "custom/defs/flutter_runner_build.nu")
source ($nu.default-config-dir | path join "custom/defs/tmux.nu")
source ($nu.default-config-dir | path join "custom/modules/debug.nu")

add-to-path ".pub-cache/bin"

# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
