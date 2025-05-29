{
  programs.git = {
    enable = true;

    userName = "Roy Ren";
    userEmail = "royite.ren@gmail.com";

    # 可选的全局 Git 配置项
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
