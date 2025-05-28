{pkgs, ...}: {
  home.packages = with pkgs; [
    # <--- LSP
    # json
    vscode-langservers-extracted
    yaml-language-server

    # bash
    bash-language-server
    shfmt

    nodejs

    # lua
    lua
    lua-language-server
    stylua
    luarocks
    jq

    # swift
    sourcekit-lsp
    # --- LSP>
  ];
}
