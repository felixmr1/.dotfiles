{ config, pkgs, ... }:

{
  imports = [
    ../linux.nix
  ];

  # NixOS VM-specific packages
  home.packages = with pkgs; [
    # Add nixos-vm-specific packages here
  ];
}
