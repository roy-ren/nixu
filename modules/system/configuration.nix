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

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.05";
  time.timeZone = "Asia/Shanghai";
}
