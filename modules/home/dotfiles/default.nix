{
  inputs,
  config,
  ...
}: let
  dotfiles = "${inputs.self}/modules/home/dotfiles";
  nushellCustom = "${inputs.self}/modules/home/nushell/custom";
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  xdg = {
    enable = true;
    configFile = {
      # "tmux".source = link "${dotfiles}/tmux";
      "nvim".source = link "${dotfiles}/nvim";
      "nushell/custom".source = link "${nushellCustom}";
      "lazygit".source = link "${dotfiles}/lazygit";
      "ghostty".source = link "${dotfiles}/ghostty";
      "starship.toml".source = link "${dotfiles}/starship.toml";
    };
  };
  home.file.".zshrc".source = link "${dotfiles}/zsh/.zshrc";
  home.file.".tmuxinator".source = link "${dotfiles}/tmuxinator";
}
