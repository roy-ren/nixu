{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "fcitx5 -d --replace"
      ];
      windowrulev2 = [
        # fcitx5 rules
        "float, class:^(fcitx)$"
        "noblur, class:^(fcitx)$"
        "noshadow, class:^(fcitx)$"
        "noanim, class:^(fcitx)$"
        "size 600 300, class:^(fcitx)$"
        "move cursor -50 -50, class:^(fcitx)$"

        # other rules
        "float, title:^(Picture-in-Picture)$"
      ];
    };
  };

  xdg.configFile = {
    "fcitx5/conf/classicui.conf".text = ''
      Vertical Candidate List=False
      PerScreenDPI=True
      Font="Noto Sans CJK SC 13"
      Theme=material-color
    '';
    "fcitx5/profile".text = ''
      [Groups/0]
      Name=Default
      Default Layout=us
      DefaultIM=pinyin

      [Groups/0/Items/0]
      Name=keyboard-us

      [Groups/0/Items/1]
      Name=pinyin
    '';
  };

  home.packages = with pkgs; [
    fcitx5-material-color
  ];
}
