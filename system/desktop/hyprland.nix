{ config, pkgs, ... }:

{
  # Hyprland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Required for screen sharing, file dialogs, etc.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # Hyprland tools
  environment.systemPackages = with pkgs; [
    waybar          # Status bar
    wofi            # App launcher
    mako            # Notifications
    hyprpaper       # Wallpaper
    hyprlock        # Lock screen
    grim            # Screenshot
    slurp           # Screen area selection
    wl-clipboard    # Clipboard
    brightnessctl   # Brightness control
    playerctl       # Media control
  ];

  # Enable PAM for hyprlock
  security.pam.services.hyprlock = {};
}
