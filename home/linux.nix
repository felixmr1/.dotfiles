{ config, pkgs, ... }:

{
  imports = [
    ./common
    ./common/gnome.nix
  ];

  home = {
    username = "felix";
    homeDirectory = "/home/felix";
  };
}
