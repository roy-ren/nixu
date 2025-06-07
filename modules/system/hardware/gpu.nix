{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # inxi -G
    inxi
    lshw-gui
    lshw
  ];

  # Load XE Intel driver
  boot.initrd.kernelModules = ["xe"];

  hardware.intelgpu = {
    loadInInitrd = true; # 推荐保持为 true
    driver = "xe";
    vaapiDriver = "intel-media-driver";
    enableHybridCodec = true; # 启用混合编码器支持
  };
}
