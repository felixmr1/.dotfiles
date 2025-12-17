{ config, pkgs, ... }:

{
  # GNOME Desktop Environment
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Pop Shell for tiling
  environment.systemPackages = with pkgs; [
    gnomeExtensions.pop-shell
  ];

  # Exclude some default GNOME apps
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-music
    epiphany  # GNOME Web browser
    geary     # Email client
  ];

  # GNOME services
  services.gnome.gnome-keyring.enable = true;
}
