{
  programs.lsd = {
    enable = true;
    # enableAliases = true;
    colors = {
      size = {
        large = "dark_yellow";
        none = "grey";
        small = "yellow";
      };
    };
    settings = {
      date = "relative";
      icons = {
        when = "auto";
        theme = "fancy";
        separator = "  ";
      };
      ignore-globs = [
        ".git"
        ".hg"
      ];
    };
  };
}
