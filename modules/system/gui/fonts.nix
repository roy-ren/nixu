{
  pkgs,
  config,
  ...
}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    jetbrains-mono
    fira-code
    fira-code-symbols
    source-code-pro
    # maple-mono-nf-cn
    # font-family = "Maple Mono NF CN"

    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.droid-sans-mono
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.space-mono
    nerd-fonts.mononoki
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["FiraCode Nerd Font"];
      sansSerif = ["Noto Sans"];
      serif = ["Noto Serif"];
    };
  };
}
