{
  inputs,
  pkgs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  imports = with builtins;
    map
    (fn: ./${fn})
    (filter (fn: fn != "default.nix") (attrNames (readDir ./.)));

  wayland.windowManager.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${system}.hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
    systemd.enable = false;
  };
}
# }: let
#   isLinux = pkgs.stdenv.isLinux;
# in {
#   config = lib.mkIf isLinux {
#     imports = [
#       ./hyprland.nix
#       # ./hyprpaper.nix
#       ./waybar.nix
#     ];
#   };

