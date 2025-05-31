{
  lib,
  config,
  ...
}: let
  # name = "cb-001.jpg";
  name = "cabin.png";
  wp = "${config.home.homeDirectory}/nixu/wallpapers/otherWallpaper/gruvbox/${name}";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = wp;
      wallpaper = ", ${wp}";
    };
  };
}
