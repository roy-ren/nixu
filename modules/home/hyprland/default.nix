{
  pkgs,
  lib,
  ...
}: let
  isLinux = pkgs.stdenv.isLinux;
in {
  # config = lib.mkIf isLinux {
  imports = with builtins;
    map
    (fn: ./${fn})
    (filter (fn: fn != "default.nix") (attrNames (readDir ./.)));
  # };
}
