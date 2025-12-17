{ config, pkgs, ... }:

# Centralized session variables for all shells.
# Fish-specific exports are in fish.nix shellInit (fish can't source .sh files).
{
  # For bash and other POSIX shells
  home.sessionVariables = {
    EDITOR = "nvim";
    npm_config_prefix = "$HOME/.npm-global";
  };

  # Extra paths
  home.sessionPath = [
    "$HOME/go/bin"
    "$HOME/.npm-global/bin"
  ];
}
