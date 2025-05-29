{
  inputs,
  config,
  ...
}: let
  dotfiles = "${inputs.self}/modules/home/dotfiles";
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  xdg = {
    enable = true;
    configFile = {
      "tmux".source = link "${dotfiles}/tmux";
      "nvim".source = link "${dotfiles}/nvim";
      "nushell/custom".source = link "${dotfiles}/nushell/custom";
      "lazygit".source = link "${dotfiles}/lazygit";
      "ghostty".source = link "${dotfiles}/ghostty";
      "starship.toml".source = link "${dotfiles}/starship.toml";
    };
  };
  home.file.".zshrc".source = link "${dotfiles}/zsh/.zshrc";
}
