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
  boot.loader.timeout = 1; # Auto-boot after 1 second

  # Hostname
  networking.hostName = "thinkpad-p1";

  # Nvidia (hybrid graphics with Intel)
  # The P1 Gen 6 has Intel integrated + Nvidia discrete
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  # NVIDIA suspend/resume fix: preserve video memory across sleep cycles
  boot.kernelParams = [
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  # Power management (important for laptop battery life)
  powerManagement.enable = true;
  services.thermald.enable = true;
}
