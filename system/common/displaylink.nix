{ config, pkgs, ... }:

{
  # DisplayLink support for USB docking stations
  boot.extraModulePackages = [ config.boot.kernelPackages.evdi ];
  boot.kernelModules = [ "evdi" ];

  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

  environment.systemPackages = with pkgs; [
    displaylink
  ];

  # Enable DisplayLink manager service
  systemd.services.dlm.wantedBy = [ "multi-user.target" ];
}
