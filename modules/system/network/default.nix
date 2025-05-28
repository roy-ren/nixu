{
  imports = [
    # ./proxychains.nix
    ./ss.nix
    ./ssh.nix
  ];

  ss = {
    enable = true;
    configFile = "/etc/shadowsocks/config.json";
  };

  networking = {
    hostName = "nixpad";
    networkmanager.enable = true;
    proxy.default = "http://127.0.0.1:1085";
    proxy.httpProxy = "http://127.0.0.1:1085";
    proxy.httpsProxy = "http://127.0.0.1:1085";
  };
}
