{...}: {
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            backslash = "backspace";
            backspace = "backslash";
          };
        };
      };
    };
  };
}
