{
  inputs,
  pkgs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${system}.hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
    systemd.enable = false;
  };
}
