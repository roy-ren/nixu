{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    lazygit

    # wl-clipboard
    wl-clipboard

    brightnessctl
    playerctl

    shadowsocks-rust
  ];
}
