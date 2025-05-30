{
  imports = [
    ./aliases.nix
  ];

  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    envFile.source = ./env.nu;

    settings = {
      show_banner = false;
    };
  };
}
