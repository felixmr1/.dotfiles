{ config, pkgs, ... }:

{
  imports = [
    ./common
    ./common/gnome.nix
    ./common/hyprland.nix
  ];

  home = {
    username = "felix";
    homeDirectory = "/home/felix";

    packages = with pkgs; [
      wl-clipboard
      gcc
      google-chrome
    ];
  };
}
