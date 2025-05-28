{
  inputs,
  pkgs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  hyprland = inputs.hyprland.packages.${system}.hyprland;
in {
  imports = [
    ./settings/colors.nix
    ./settings/env.nix
    ./settings/execs.nix
    ./settings/general.nix
    ./settings/inputs.nix
    ./settings/keybinds.nix
  ];

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = hyprland;
  wayland.windowManager.hyprland.systemd.enable = false;
}
