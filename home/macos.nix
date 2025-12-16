{ config, pkgs, ... }:

{
  imports = [
    ./common
  ];

  home = {
    username = "felix";
    homeDirectory = "/Users/felix";
  };
}
