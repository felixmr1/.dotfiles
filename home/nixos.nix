{ config, pkgs, ... }:

{
  imports = [
    ./common
  ];

  home = {
    username = "felix";
    homeDirectory = "/home/felix";
  };

  # NixOS-specific packages
  home.packages = with pkgs; [
    # Add nixos-specific packages here
  ];

  # NixOS-specific configuration
  # Example: systemd user services, Linux-only tools, etc.
}
