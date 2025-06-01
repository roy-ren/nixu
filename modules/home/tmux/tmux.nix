{pkgs, ...}: {
  # Whether to enable tmux. boolean
  programs.tmux.enable = true;

  # Resize the window to the size of the smallest session for which it is the current window.  boolean
  programs.tmux.aggressiveResize = true;

  # Base index for windows and panes. unsigned integer, meaning >=0
  programs.tmux.baseIndex = 1;

  # Use 24 hour clock. boolean
  programs.tmux.clock24 = true;

  # Override the hjkl and HJKL bindings for pane navigation and resizing in VI mode.  boolean
  programs.tmux.customPaneNavigationAndResize = true;

  # Disable confirmation prompt before killing a pane or window  boolean
  programs.tmux.disableConfirmationPrompt = true;

  # Time in milliseconds for which tmux waits after an escape is input.  unsigned integer, meaning >=0
  programs.tmux.escapeTime = 0;

  # Additional configuration to add to {file}`tmux.conf`.  strings concatenated with "\n"
  programs.tmux.extraConfig = ''
    # sesh: Recommended tmux Settings
    bind-key m kill-pane # skip "kill-pane 1? (y/n)" prompt
    set -g detach-on-destroy off  # don't exit from tmux when closing a session
    bind -N "last-session (via sesh) " L run-shell "sesh last"
    # connect to root
    bind -N "switch to root session (via sesh) " 9 run-shell "sesh connect --root \'$(pwd)\'"
    bind-key "R" display-popup -E -w 40% "sesh connect \"$(
      sesh list -i -H | gum filter --value \"$(sesh root)\" --limit 1 --fuzzy --no-sort --placeholder 'Pick a sesh' --prompt='⚡'readme
    )\""

    bind-key "E" run-shell "sesh connect \"$(
      sesh list --icons | fzf-tmux -p 80%,70% \
        --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
        --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
        --bind 'tab:down,btab:up' \
        --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
        --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
        --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
        --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
        --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
        --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
        --preview-window 'right:55%' \
        --preview 'sesh preview {}'
    )\""

    bind ^L switch-client -l

    # window
    bind ^C new-window -c "#{pane_current_path}"
    bind ^V copy-mode

    bind ` last-window

    set -g set-clipboard on          # use system clipboard
    set -g status-position top       # macOS / darwin style

    # 系统剪切板
    bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "wl-copy"
  '';

  # On supported terminals, request focus events and pass them through to applications running in tmux.  boolean
  programs.tmux.focusEvents = true;

  # Maximum number of lines held in window history. positive integer, meaning >0
  programs.tmux.historyLimit = 100000;

  # VI or Emacs style shortcuts. one of "emacs", "vi"
  programs.tmux.keyMode = "vi";

  # Whether to enable mouse support. boolean
  programs.tmux.mouse = false;

  # Automatically spawn a session if trying to attach and none are running.  boolean
  programs.tmux.newSession = true;

  # The tmux package to use. package
  # programs.tmux.package

  # List of tmux plugins to be included at the end of your tmux configuration. The sensible plugin, however, is defaulted to run at the top of your configuration.  list of plugin packages or submodules
  programs.tmux.plugins = with pkgs; [
    {
      plugin = tmuxPlugins.catppuccin;
      # extraConfig = ''
      #   set-option -ga terminal-overrides ",xterm-256color:Tc"
      #
      #   # 纯手动配置 Unicode 字符样式
      #   set -g status-style "bg=default,fg=white"
      #   set -g status-left " NerdFont "
      #   set -g status-left-length 100
      #
      #   # 可选更多 Catppuccin 样式：
      #   set -g window-status-current-format "#[fg=cyan]#[bold]#W#[fg=default]"
      #   set -g window-status-format "#[fg=grey]#W"
      # '';
      extraConfig = ''
        set -g @session_prefix_waiting "#d95f18"
        set -g @session_normal "#665c54"

        set -ogq "@catppuccin_session_color" "#{?client_prefix,#{@session_prefix_waiting},#{@session_normal}}"

        set -g @catppuccin_window_status_icon_enable "yes"

        set -g @catppuccin_window_left_separator ""
        set -g @catppuccin_window_right_separator " "
        set -g @catppuccin_window_middle_separator " █"
        set -g @catppuccin_window_number_position "right"

        set -g @catppuccin_window_default_fill "number"
        set -g @catppuccin_window_default_text "#W"

        set -g @catppuccin_window_current_fill "number"
        set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"

        set -g @catppuccin_status_modules_left "session"
        set -g @catppuccin_status_modules_right "directory date_time"
        set -g @catppuccin_status_left_separator  " "
        set -g @catppuccin_status_right_separator ""
        set -g @catppuccin_status_right_separator_inverse "no"
        set -g @catppuccin_status_fill "icon"
        set -g @catppuccin_status_connect_separator "no"

        set -g @catppuccin_directory_text "#{pane_current_path}"
        set -g @catppuccin_date_time_text "%H:%M"
      '';
    }
  ];

  # Set the prefix key. Overrules the "shortcut" option when set.  null or string
  programs.tmux.prefix = "`";

  # Number of lines/columns when resizing. positive integer, meaning >1
  programs.tmux.resizeAmount = 5;

  # Reverse the window split shortcuts. boolean
  programs.tmux.reverseSplit = true;

  # Store tmux socket under {file}`/run`, which is more secure than {file}`/tmp`, but as a downside it doesn't survive user logout.  boolean
  programs.tmux.secureSocket = true;

  # Run the sensible plugin at the top of the configuration. It is possible to override the sensible settings using the {option}`programs.tmux.extraConfig` option.  boolean
  programs.tmux.sensibleOnTop = true;

  # Set the default-shell tmux variable. null or string
  programs.tmux.shell = "${pkgs.nushell}/bin/nu";

  # CTRL following by this key is used as the main shortcut.  string
  # programs.tmux.shortcut = "a";

  # Set the $TERM variable. string
  programs.tmux.terminal = "tmux-256color";

  # Whether to enable tmuxinator. boolean
  programs.tmux.tmuxinator.enable = true;

  # Whether to enable tmuxp. boolean
  programs.tmux.tmuxp.enable = true;

  # Whether to enable setting `FZF_TMUX=1` which causes shell integration to use fzf-tmux . boolean
  programs.fzf.tmux.enableShellIntegration = true;

  # If {option}`programs.fzf.tmux.enableShellIntegration` is set to `true`, shell integration will use these options for fzf-tmux. See {command}`fzf-tmux --help` for available options.  list of string
  programs.fzf.tmux.shellIntegrationOptions = [];
}
