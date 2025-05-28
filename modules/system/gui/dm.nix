{
  config,
  pkgs,
  ...
}: let
  hyprland = "${config.programs.hyprland.package}/bin/Hyprland";
  regreet = "${config.programs.regreet.package}/bin/regreet";
  hyprConf = pkgs.writeText "greetd-hyprland-config" ''
    exec-once = ${regreet}; hyprctl dispatch exit
    misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
        disable_hyprland_qtutils_check = true
    }
    env = GTK_USE_PORTAL,0
    env = GDK_DEBUG,no-portals
  '';
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${hyprland} --config ${hyprConf}";
        user = "roy";
      };
    };
  };

  programs.uwsm = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  programs.regreet = {
    enable = true;
    font = {
      size = 14;
      name = "FiraCode";
    };
    cageArgs = ["-s" "-m" "last"];
    settings = {
      background = {
        fit = "Contain"; # 背景图像的适应方式
      };
      GTK = {
        application_prefer_dark_theme = true;
        font_name = "FiraCode 14";
        theme_name = "Adwaita";
      };
      appearance = {
        greeting_msg = "Hello Roy";
      };
    };
  };
}
