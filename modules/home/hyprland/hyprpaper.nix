{
  lib,
  config,
  ...
}: let
  # name = "cb-001.jpg";
  name = "cabin.png";
  wp = "${config.home.homeDirectory}/nixu/modules/home/hypr/wallpapers/otherWallpaper/gruvbox/${name}";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = lib.mkDefault wp;
      wallpaper = lib.mkForce ", ${wp}";
    };
  };
}
