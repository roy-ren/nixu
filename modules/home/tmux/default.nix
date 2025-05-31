{pkgs, ...}: {
  imports = [
    ./sesh.nix
    ./tmux.nix
    # ./tmuxa.nix
  ];

  home.packages = with pkgs; [
    tmuxinator
    sesh
    fzf
  ];
}
