{
  inputs,
  pkgs,
  ...
}: {
  stylix.enable = true;
  # stylix.image = inputs.self + "/path/to/image.png";
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix.targets = {
    waybar.enable = false;
    rofi.enable = false;
    hyprland.enable = false;
    hyprlock.enable = false;
    ghostty.enable = false;
  };

  # 选择壁纸（图片路径或URL）
  # stylix.image = ../../wallpapers/wallpaper.png;
  stylix.image = null;

  # 使用 base16 配色方案（例如从 https://github.com/tinted-theming/base16-schemes 选择）
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  # 自动为支持的应用程序应用主题
  stylix.autoEnable = true;

  # 设置字体
  stylix.fonts = {
    monospace = {
      name = "Fira Code";
      package = pkgs.fira-code;
    };
    sansSerif = {
      name = "Inter";
      package = pkgs.inter;
    };
  };
}
