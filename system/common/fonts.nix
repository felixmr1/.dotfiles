{ config, pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.roboto-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
  ];

  # Font configuration
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "RobotoMono Nerd Font" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };
}
