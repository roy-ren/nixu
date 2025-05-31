# 自动连接K8 键盘与Apple Touchpad
# DC:2C:26:2F:92:CB  # Keyboard
# 18:7E:B9:69:57:49  # Apple Touchpad
{pkgs, ...}: let
  bluetoothctlScript = pkgs.writeShellScript "bluetooth-autoconnect.sh" ''
    ${pkgs.bluez}/bin/bluetoothctl <<EOF
    power on
    agent on
    default-agent
    trust DC:2C:26:2F:92:CB
    connect DC:2C:26:2F:92:CB
    trust 18:7E:B9:69:57:49
    connect 18:7E:B9:69:57:49
    trust 08:F0:B6:9C:99:31
    connect 08:F0:B6:9C:99:31
    EOF
  '';
in {
  home.packages = [pkgs.bluez];

  systemd.user.services.bluetooth-autoconnect = {
    Unit = {
      Description = "Auto-connect Bluetooth Devices";
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${bluetoothctlScript}";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
}
