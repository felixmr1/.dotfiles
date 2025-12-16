{ config, pkgs, ... }:

{
  imports = [
    ../../common
    ../../desktop/gnome.nix
    ../../desktop/hyprland.nix
    ./hardware-configuration.nix
  ];

  # Boot loader (GRUB for BIOS)
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

  # Hostname
  networking.hostName = "nixos-vm";

  # VM-specific settings
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
