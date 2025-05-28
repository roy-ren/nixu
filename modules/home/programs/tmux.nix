{pkgs, ...}: let
  tmux-sessionx = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "sessionx";
    version = "unstable-2024-12-28";
    src = pkgs.fetchFromGitHub {
      owner = "omerxx";
      repo = "tmux-sessionx";
      rev = "4f58ca79b1c6292c20182ab2fce2b1f2cb39fb9b";
      sha256 = "/fmcgFxu2ndJXYNJ3803arcecinYIajPI+1cTcuFVo0=";
    };
  };
in {
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = false;
    escapeTime = 0;
    focusEvents = true;
    historyLimit = 100000;
    keyMode = "vi";
    mouse = false;
    newSession = true;
    prefix = "C-a";
    resizeAmount = 4;
    sensibleOnTop = true;
    shell = "${pkgs.fish}/bin/fish";
    shortcut = "a";
    terminal = "tmux-256color";
    tmuxinator.enable = true;
    tmuxp.enable = true;

    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.tmux-thumbs
      tmuxPlugins.tmux-fzf
      {
        plugin = tmuxPlugins.catppuccin;
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
      {
        plugin = tmux-sessionx;

        extraConfig = ''
          set -g @sessionx-bind-zo-new-window 'ctrl-y'
          set -g @sessionx-auto-accept 'off'
          set -g @sessionx-bind '^E'

          set -g @sessionx-window-mode 'on'
          set -g @sessionx-window-height '80%'
          set -g @sessionx-window-width '90%'
          set -g @sessionx-zoxide-mode 'on'
          set -g @sessionx-tree-mode 'on'
          set -g @sessionx-preview-location 'top'
          set -g @sessionx-preview-ratio '80%'
          set -g @sessionx-filter-current 'false'

          set -g @sessionx-custom-paths '/home/roy/nixc'
          set -g @sessionx-custom-paths-subdirectories 'true'
        '';
      }
      {
        plugin = tmuxPlugins.tmux-floax;
        extraConfig = ''
          set -g @floax-width '80%'
          set -g @floax-height '80%'
          set -g @floax-border-color 'magenta'
          set -g @floax-text-color 'blue'
          set -g @floax-bind 'p'
          set -g @floax-change-path 'true'
        '';
      }
      {
        plugin = tmuxPlugins.fzf-tmux-url;
        extraConfig = ''
          set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
          set -g @fzf-url-history-limit '2000'
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }
    ];

    extraConfig = ''
      # session
      bind ^L switch-client -l

      # window
      bind ^C new-window -c "#{pane_current_path}"
      bind ^V copy-mode

      bind ^A last-window
      bind s split-window -v -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"

      # pane
      bind h select-pane -L
      bind ^M kill-pane

      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
      set -g default-terminal "tmux-256color"  # 与 $TERM 一致

      set -g detach-on-destroy off     # don't exit from tmux when closing a session
      set -g renumber-windows on       # renumber all windows when any window is closed
      set -g set-clipboard on          # use system clipboard
      set -g status-position top       # macOS / darwin style

      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'
    '';
  };
}
