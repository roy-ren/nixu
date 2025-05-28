{
  inputs,
  pkgs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  # 禁用 X11
  services.xserver.enable = false;

  # 启用 Wayland 支持
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };
}
