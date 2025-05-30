{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    clang
    gcc
    lazygit

    # wl-clipboard
    wl-clipboard

    brightnessctl
    playerctl

    shadowsocks-rust
    nushell
  ];
}
