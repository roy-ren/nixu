{
  # Whether to enable a shell alias `s` to quickly launch sessions. boolean
  programs.sesh.enableAlias = false;

  # Enable Tmux integration with sesh. boolean
  programs.sesh.enableTmuxIntegration = true;

  # Whether to enable the sesh terminal session manager. boolean
  programs.sesh.enable = true;

  # The fzf package to use. null or package
  # programs.sesh.fzfPackage

  # Display icons next to results ({option}`--icons` argument).  boolean
  programs.sesh.icons = true;

  # The sesh package to use. package
  # programs.sesh.package

  # Configuration for sesh, written to `~/.config/sesh/sesh.toml`. See the [sesh documentation](https://github.com/joshmedeski/sesh#configuration) for available options.  TOML value
  programs.sesh.settings = {
    session = [
      {
        name = " nixu";
        path = "~/nixu";
        startup_command = "nvim flake.nix";
      }
      {
        name = "Downloads 📥";
        path = "~/Downloads";
        startup_command = "ls";
      }
      {
        name = "Dev 🧑‍💻";
        path = "~/projects/";
        startup_command = "nvim";
      }
    ];
  };

  # Keybinding for invoking sesh in Tmux. string
  programs.sesh.tmuxKey = "C-e";

  # The zoxide package to use.
  # programs.sesh.zoxidePackage
}
