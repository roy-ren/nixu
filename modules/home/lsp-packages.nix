{pkgs, ...}: {
  home.packages = with pkgs; [
    # <--- LSP
    # json
    vscode-langservers-extracted
    yaml-language-server

    # bash
    bash-language-server
    shfmt
    latex2html

    nodejs

    # lua
    lua
    lua-language-server
    stylua
    luarocks
    jq
    tree-sitter
    latex2html

    # swift
    sourcekit-lsp
    # --- LSP>
  ];
}
