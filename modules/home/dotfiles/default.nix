{
  lib,
  config,
  ...
}: {
  xdg.configFile = let
    dotfiles = "${config.home.homeDirectory}/nixconfig/modules/home/dotfiles";
    link = config.lib.file.mkOutOfStoreSymlink;
  in {
    "ghostty".source = link "${dotfiles}/ghostty";
    # "nvim".source = link "${dotfiles}/nvim";
    # "starship.toml".source = lib.mkDefault link "${dotfiles}/starship.toml";
  };
}
