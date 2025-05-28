{
  lib,
  config,
  pkgs,
  ...
}: {
  options.ss = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Shadowsocks service.";
    };
    configFile = lib.mkOption {
      type = lib.types.str;
      default = "/etc/shadowsocks/config.json";
      description = "Path to the Shadowsocks configuration file.";
    };
  };

  config = lib.mkIf config.ss.enable {
    systemd.services.ss = {
      description = "Shadowsocks Service";
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        ExecStart = "${pkgs.shadowsocks-rust}/bin/sslocal -c ${config.ss.configFile}";
        Restart = "always";
      };
    };
  };
}
