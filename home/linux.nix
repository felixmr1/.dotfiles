{ config, pkgs, ... }:

{
  imports = [
    ./common
  ];

  home = {
    username = "felix";
    homeDirectory = "/home/felix";
  };
}
