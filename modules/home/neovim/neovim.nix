{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    # fzf-lua [optional:media] ~
    viu
    chafa
    ueberzugpp

    # img-clip.nvim ~
    xclip
    # luarocks ~
    # lua5_1

    # luasnip
    # jsregexp

    latex2html
    latex2mathml

    # Snacks
    tectonic
    pdf-parser
    imagemagick
    ghostscript
    nodePackages.mermaid-cli

    # clipboard
    wl-clipboard
  ];
}
