{pkgs, ...}: {
  fonts.fontDir.enable = true;

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;

    fcitx5.waylandFrontend = true;

    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons # table input method support
      fcitx5-nord # a color theme
    ];
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            backslash = "backspace";
            backspace = "backslash";
          };
        };
      };
    };
  };
}
