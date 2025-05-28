{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../modules/system
  ];

  users.users.roy = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
  };

  nix.settings.trusted-users = ["root" "roy"];

  programs = {
    zsh.enable = true;
  };
}
