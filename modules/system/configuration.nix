{...}: {
  #enable flakse
  nix.settings. experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    systemd-boot.configurationLimit = 20;
  };

  # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."roy" = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICgiVRImgSj9zmeXtGgxsNyGY9HxCQgWKxIkdHS4mz4q royite.ren@gmail.com"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.05";
  time.timeZone = "Asia/Shanghai";
}
