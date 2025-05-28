{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules/home
  ];

  home.username = "roy";
  home.homeDirectory = lib.mkDefault "/${
    if pkgs.stdenv.isDarwin
    then "Users"
    else "home"
  }/roy";

  home.stateVersion = "25.05";
}
