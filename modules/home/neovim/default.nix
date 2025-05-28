{
  imports = [
    # flake.inputs.nixvim.homeManagerModules.nixvim
    ./neovim.nix
  ];

  # programs.nixvim =
  #   import ./nixvim.nix
  #   // {
  #     enable = true;
  #   };
}
