{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./fonts.nix
  ];

  # Networking
  networking.networkmanager.enable = true;

  # Timezone and locale
  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # User account
  users.users.felix = {
    isNormalUser = true;
    description = "Felix";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker" ];
    shell = pkgs.fish;
  };

  # Keyboard - remap Caps Lock to Escape
  services.xserver.xkb = {
    layout = "us,se";
    options = "caps:escape";
  };
  console.useXkbConfig = true;

  # Enable fish system-wide
  programs.fish.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Location services (for darkman sunrise/sunset switching)
  services.geoclue2 = {
    enable = true;
    enableWifi = true;  # Improves location accuracy
    # Grant all users access (needed for user-level darkman service)
    geoProviderUrl = "https://location.services.mozilla.com/v1/geolocate?key=geoclue";
    appConfig.darkman = {
      isAllowed = true;
      isSystem = false;
    };
    # Allow desktop applications to use geoclue
    appConfig."org.freedesktop.GeoClue2" = {
      isAllowed = true;
      isSystem = false;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
  ];

  # This value determines the NixOS release
  system.stateVersion = "25.05";
}
