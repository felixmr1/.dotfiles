{ config, pkgs, ... }:

{
  imports = [
    ../../common
    ../../desktop/gnome.nix
    ../../desktop/hyprland.nix
    ./hardware-configuration.nix
  ];

  # Hostname
  networking.hostName = "nixos-vm";

  # VM-specific settings
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
