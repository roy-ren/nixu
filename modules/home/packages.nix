{pkgs, ...}: {
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    firefox
    neofetch
    pkg-config
    unzip
    zip

    # Unix tools
    ripgrep # Better `grep`
    fd
    sd
    tree
    gnumake

    nushell
    starship
  ];

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    fzf.enable = true;

    ghostty.enable = true;

    zoxide.enable = true;
  };
}
