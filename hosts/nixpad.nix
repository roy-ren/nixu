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

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];

  security.polkit.enable = true;
  services.dbus.enable = true;

  nix.settings.trusted-users = ["root" "roy"];

  # home-manager.backupFileExtension = ".bak";

  programs = {
    zsh.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };
}
