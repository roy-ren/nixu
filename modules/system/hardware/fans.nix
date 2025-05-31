{pkgs, ...}: {
  # ThinkFan 风扇控制服务
  services.thinkfan = {
    enable = true;

    # 自定义风扇转速等级映射 (可选)
    levels = [
      [0 0 55]
      [1 50 60]
      [2 55 65]
      [3 60 70]
      [4 65 75]
      [5 70 80]
      [7 75 32767]
    ];

    # 传感器配置：ThinkPad ACPI 传感器
    sensors = [
      {
        type = "tpacpi";
        query = "/proc/acpi/ibm/thermal";
      }
    ];
  };

  # 启用 thermald 进行主动温控
  services.thermald.enable = true;

  # 温和睿频控制
  boot.kernelParams = ["intel_pstate=passive"];
  services.tlp.enable = false;

  programs.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        # performance
        governor = "ondemand";
        turbo = "auto";
      };

      battery = {
        governor = "powersave";
        turbo = "auto";
      };
    };
  };
  hardware.cpu.intel.updateMicrocode = true;
  environment.systemPackages = [pkgs.lm_sensors];
}
