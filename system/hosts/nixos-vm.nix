{ config, pkgs, ... }:

{
  imports = [
    ../common
    ../desktop/gnome.nix
    ../desktop/hyprland.nix
    # Hardware configuration will be generated during install
    # ./hardware-configuration.nix
  ];

  # Hostname
  networking.hostName = "nixos-vm";

  # VM-specific settings
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  # VM display settings (adjust as needed)
  # services.xserver.videoDrivers = [ "qxl" ];
}
