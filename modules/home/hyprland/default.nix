{
  lib,
  pkgs,
  ...
}: let
  isLinux = pkgs.stdenv.isLinux;
in {
  config = lib.mkIf isLinux {
    imports = [
      ./hyprland.nix
      # ./hyprpaper.nix
      ./waybar.nix
    ];
  };
}
