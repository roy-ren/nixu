{pkgs, ...}: {
  programs.kitty.enable = true;
  wayland.windowManager.hyprland.enable = true;

  # Hyprland 环境支持
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
