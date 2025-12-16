{ config, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./alacritty.nix
    ./nvim.nix
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Packages installed to user profile
  home.packages = with pkgs; [
    # CLI tools
    lazygit
    lazydocker

    # Fonts
    nerd-fonts.roboto-mono
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "24.05";
}
