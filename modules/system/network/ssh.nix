{
  # ssh
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no"; # disable root login
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };

  # services.ssh-agent.enable = true;
  programs.ssh.startAgent = true;
}
