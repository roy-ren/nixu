{pkgs, ...}: {
  # 蓝牙相关软件（可用于命令行调试或图形管理）
  environment.systemPackages = with pkgs; [
    bluez
    blueman # 如果你想要 GUI
    overskride
  ];

  services.blueman.enable = true; # 可选 GUI 管理蓝牙

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Name = "nixpad";
        Class = "0x000540";
        DiscoverableTimeout = 0;
        PairableTimeout = 0;
      };
    };
  };

  # 蓝牙管理器服务（必需）
  services.dbus.enable = true;
}
