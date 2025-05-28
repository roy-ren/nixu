{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_options = "altwin:swap_alt_win";
      repeat_rate = 50;
      repeat_delay = 300;

      # 鼠标灵敏度
      sensitivity = 0.35;
      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        clickfinger_behavior = true;
        scroll_factor = 1.0;
      };

      special_fallthrough = true;
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_distance = 700;
      workspace_swipe_fingers = 4;
      workspace_swipe_cancel_ratio = 0.2;
      workspace_swipe_min_speed_to_force = 5;
      workspace_swipe_direction_lock = true;
      workspace_swipe_direction_lock_threshold = 10;
      workspace_swipe_create_new = true;
    };
  };
}
