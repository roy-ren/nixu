{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "nixos-unified-template-shell";
      meta.description = "Shell environment for modifying this Nix configuration";

      packages = with pkgs; [
        just
        nixd
      ];

      shellHook = ''
        echo "📦 已进入 Nix 开发环境：nixos-unified-template-shell"
        echo "💡 如需为 nix-daemon 配置代理（socks5h://localhost:****），请运行：just set-proxy"
      '';
    };
  };
}
