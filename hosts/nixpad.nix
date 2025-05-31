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
    extraGroups = [
      "wheel"
      "bluetooth"
      "networkmanager"
    ];
    shell = pkgs.nushell;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICgiVRImgSj9zmeXtGgxsNyGY9HxCQgWKxIkdHS4mz4q royite.ren@gmail.com"
    ];
  };

  security.polkit.enable = true;
  services.dbus.enable = true;

  nix.settings.trusted-users = ["root" "roy"];
}
