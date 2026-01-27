{ config, pkgs, ... }:

{
  imports = [
    ../../common
    ../../desktop/gnome.nix
    ./hardware-configuration.nix
  ];

  # Boot loader (UEFI with systemd-boot)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 1;

  # Hostname
  networking.hostName = "thinkpad-t14";

  # Intel graphics (T14 Gen 1 has integrated Intel only)
  services.xserver.videoDrivers = [ "modesetting" ];

  # Gaming
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Power management for laptop battery life
  powerManagement.enable = true;
  services.thermald.enable = true;
}
