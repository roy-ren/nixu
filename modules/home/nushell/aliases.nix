{
  programs.nushell.shellAliases = {
    # Shortcuts
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";

    dl = "cd ~/Downloads";
    dt = "cd ~/Desktop";
    p = "cd ~/projects";
    paas = "cd ~/projects/paas/";

    cc = "nmcli -p c u 9e6dfef8-d1c3-4246-bb8d-22c10351cb5c";

    # ls
    l = "ls";
    la = "ls -a";
    ll = "ls -l";
    lla = "ls -la";
    lt = "lsd --tree";

    # neovim
    nv = "nvim";
    vi = "nvim";
    vim = "nvim";

    # tmux
    "t" = "tmux";
    "ta" = "tmux attach";

    # stow
    stowr = "stow -R . -v";

    # git
    lg = "lazygit";
    g = "git";

    # just
    j = "just";
    jr = "just run";

    # flutter
    f = "fvm flutter";
    fp = "f pub";
    fpg = "fp get";
    fpa = "fp add";
    fpad = "fp add --dev";

    # flutter watch
    fw = "flutter_watch";
    fcw = "flutter_okmc_watch";

    fr = "f run --pid-file=/tmp/tf1.pid";
    frp = "f run --pid-file=/tmp/tf1.pid --profile";

    d = "fvm dart";
    dp = "d pub";
    dpg = "dp get";

    dr = "d run";

    # build_runner
    drb = "dr build_runner";
    drbc = "drb clean";
    drbb = "drb build";
    drbs = "drb serve";
    drbw = "drb watch";
    # w_drb_watching_all = "w_drb_watching --keys="m watch"";

    # melos
    dpgam = "dp global activate melos";
    m = "fvm exec melos";
    mr = "m run";
    mrg = "m run gen";
    mrw = "m run watch";
    mbs = "m bootstrap";
    mbsnp = "mbs --no-private";
    mp = "m publish";
    mpdr = "mp --dry-run";
  };
}
