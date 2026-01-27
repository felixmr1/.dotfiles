{ config, pkgs, ... }:

{
  imports = [
    ../linux.nix
  ];

  # Personal machine - no work environment variables

  # T14-specific packages
  home.packages = with pkgs; [
    # Media
    vlc
    spotify

    # Gaming
    steam
    mangohud
    protonup-qt

    # VPN
    mullvad-vpn
  ];
}
