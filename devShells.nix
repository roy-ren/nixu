{pkgs, ...}: {
  devShells.default = pkgs.mkShell {
    name = "nixu";
    meta.description = "Shell environment for modifying this Nix configuration";

    packages = with pkgs; [
      # Nix dev
      cachix
      just
      nil # Nix language server
      nix-info
      nixpkgs-fmt

      # nix
      alejandra
      nixd
      nixdoc

      git
      lazygit

      home-manager
      nushell
      starship
    ];

    shellHook = ''
      echo "📦 已进入 Nix 开发环境：nixu"
      echo "💡 如需为 nix-daemon 配置代理（socks5h://localhost:****），请运行：just set-proxy"
    '';
  };
}
