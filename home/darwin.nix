{ config, pkgs, ... }:

{
  imports = [
    ./common
  ];

  home = {
    username = "felix";
    homeDirectory = "/Users/felix";
  };

  # macOS-specific packages
  home.packages = with pkgs; [
    # Add darwin-specific packages here
  ];

  # macOS-specific configuration
  # Example: Homebrew casks, macOS-only tools, etc.
}
