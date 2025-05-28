{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 2;
      gaps_out = 3;
      gaps_workspaces = 5;
      border_size = 1;
      resize_on_border = true;
      no_focus_fallback = true;

      layout = "dwindle";
      allow_tearing = true; # This just allows the `immediate` window rule to work
    };

    monitor = [
      "eDP-1,2880x1800@120,0x0,1"
      "HDMI-A-1,3840x2160@60,-480x-2100,1"
    ];

    workspace = [
      # 4k 显示器（HDMI-A-1）
      "1, monitor:HDMI-A-1"
      "2, monitor:HDMI-A-1"
      "4, monitor:HDMI-A-1"
      "5, monitor:HDMI-A-1"
      "6, monitor:HDMI-A-1"

      # 3K 显示器（DP-1）
      "3, monitor:DP-1"
      "7, monitor:DP-1"
      "8, monitor:DP-1"
      "9, monitor:DP-1"
      "10, monitor:DP-1"
    ];

    dwindle = {
      preserve_split = true;
      smart_split = false;
      smart_resizing = false;
    };

    decoration = {
      rounding = 20;

      blur = {
        enabled = true;
        xray = true;
        special = false;
        new_optimizations = true;
        size = 14;
        passes = 4;
        brightness = 1;
        noise = 0.01;
        contrast = 1;
        popups = true;
        popups_ignorealpha = 0.6;
      };

      # Shadow
      shadow = {
        enabled = true;
        ignore_window = true;
        range = 20;
        offset = "0 2";
        render_power = 4;
        color = "rgba(0000002A)";
      };

      # Window Opacities
      # active_opacity = 1
      # inactive_opacity = 1
      # fullscreen_opacity = 1

      # Shader
      # screen_shader = ~/.config/hypr/shaders/nothing.frag
      # screen_shader = ~/.config/hypr/shaders/vibrance.frag

      # Dim
      dim_inactive = false;
      dim_strength = 0.1;
      dim_special = 0;
    };

    # animations = {
    #     enabled = true;
    #     # Animation curves
    #
    #     bezier = linear, 0, 0, 1, 1;
    #     bezier = md3_standard, 0.2, 0, 0, 1;
    #     bezier = md3_decel, 0.05, 0.7, 0.1, 1;
    #     bezier = md3_accel, 0.3, 0, 0.8, 0.15
    #     bezier = overshot, 0.05, 0.9, 0.1, 1.1
    #     bezier = crazyshot, 0.1, 1.5, 0.76, 0.92
    #     bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
    #     bezier = menu_decel, 0.1, 1, 0, 1
    #     bezier = menu_accel, 0.38, 0.04, 1, 0.07
    #     bezier = easeInOutCirc, 0.85, 0, 0.15, 1
    #     bezier = easeOutCirc, 0, 0.55, 0.45, 1
    #     bezier = easeOutExpo, 0.16, 1, 0.3, 1
    #     bezier = softAcDecel, 0.26, 0.26, 0.15, 1
    #     bezier = md2, 0.4, 0, 0.2, 1 # use with .2s duration
    #     # Animation configs
    #     animation = windows, 1, 3, md3_decel, popin 60%
    #     animation = windowsIn, 1, 3, md3_decel, popin 60%
    #     animation = windowsOut, 1, 3, md3_accel, popin 60%
    #     animation = border, 1, 10, default
    #     animation = fade, 1, 3, md3_decel
    #     # animation = layers, 1, 2, md3_decel, slide
    #     animation = layersIn, 1, 3, menu_decel, slide
    #     animation = layersOut, 1, 1.6, menu_accel
    #     animation = fadeLayersIn, 1, 2, menu_decel
    #     animation = fadeLayersOut, 1, 4.5, menu_accel
    #     animation = workspaces, 1, 7, menu_decel, slide
    #     # animation = workspaces, 1, 2.5, softAcDecel, slide
    #     # animation = workspaces, 1, 7, menu_decel, slidefade 15%
    #     # animation = specialWorkspace, 1, 3, md3_decel, slidefadevert 15%
    #     animation = specialWorkspace, 1, 3, md3_decel, slidevert
    # };

    misc = {
      vfr = 1;
      vrr = 1;
      animate_manual_resizes = false;
      animate_mouse_windowdragging = false;
      enable_swallow = false;
      # swallow_regex = (foot|kitty|allacritty|Alacritty);

      disable_hyprland_logo = true;
      force_default_wallpaper = 0;
      new_window_takes_over_fullscreen = 2;
      allow_session_lock_restore = true;

      initial_workspace_tracking = false;
    };

    # Overview
    plugin = {
      hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = "#000000";
        workspace_method = "first 1"; # [center/first] [workspace] e.g. first 1 or center m+1;

        enable_gesture = false; # laptop touchpad, 4 fingers
        gesture_distance = 300; # how far is the "max"
        gesture_positive = false;
      };
    };
  };
}
