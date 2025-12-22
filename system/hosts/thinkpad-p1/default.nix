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

  # Hostname
  networking.hostName = "thinkpad-p1";

  # Nvidia (hybrid graphics with Intel)
  # The P1 Gen 6 has Intel integrated + Nvidia discrete
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false; # Use proprietary driver for better compatibility
    nvidiaSettings = true;
    prime = {
      # Run `lspci | grep -E "VGA|3D"` to find your bus IDs
      # Format: "PCI:X:Y:Z" where X:Y.Z is from lspci output
      intelBusId = "PCI:0:2:0";     # Adjust after lspci check
      nvidiaBusId = "PCI:1:0:0";    # Adjust after lspci check
      offload = {
        enable = true;
        enableOffloadCmd = true;    # Provides `nvidia-offload` command
      };
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  # Power management (important for laptop battery life)
  powerManagement.enable = true;
  services.thermald.enable = true;
}
