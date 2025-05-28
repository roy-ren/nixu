{inputs, ...}: {
  systems = ["x86_64-linux" "aarch64-darwin"];

  flake = {
    nixosConfigurations.nixpad = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./hosts/nixpad.nix
        inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1
      ];
    };

    darwinConfigurations.lagoon = inputs.darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./hosts/lagoon.nix
        # inputs.home-manager.darwinModules.home-manager
      ];
    };

    # flake.parts.nix 中的 flake.homeConfigurations
    homeConfigurations."roy@nixpad" = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      modules = [./users/roy.nix];

      extraSpecialArgs = {
        inherit inputs;
      };
    };
  };

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
