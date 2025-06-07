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
  # 启用 tlp 进行电源管理和节能
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_BOOST_ON_BAT = 0;
    };
  };

  hardware.cpu.intel.updateMicrocode = true;
  environment.systemPackages = [pkgs.lm_sensors];
}
