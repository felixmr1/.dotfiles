{ config, pkgs, ... }:

{
  imports = [
    ../macos.nix
  ];

  # macOS-specific packages
  home.packages = with pkgs; [
    # Add macbook-specific packages here
  ];
}
