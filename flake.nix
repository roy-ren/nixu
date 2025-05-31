{
  description = "A home-manager template providing useful tools & settings for Nix-based development";

  nixConfig = {
    extra-substituters = ["https://hyprland.cachix.org"];
    extra-trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";

    # nix darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixos
    stylix.url = "github:danth/stylix";

    # ThinkPad X1 Carbon hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-darwin"];

      imports = [
        ./flake.parts.nix
      ];
    };
}
