{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    clang
    gcc
    lazygit

    brightnessctl
    playerctl

    shadowsocks-rust
    nushell
    inputs.zen-browser.packages.${pkgs.system}.default

    neovimWithClipboard
  ];
}
