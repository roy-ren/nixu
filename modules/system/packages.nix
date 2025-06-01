{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    clang
    gcc
    lazygit

    brightnessctl
    playerctl

    shadowsocks-rust
    nushell
  ];
}
