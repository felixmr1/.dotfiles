{ config, pkgs, lib, ... }:

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
    nodejs_22
  ];

  # Install npm packages on activation
  home.activation.installNpmPackages = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    export PATH="${pkgs.nodejs_22}/bin:$PATH"
    export npm_config_prefix="$HOME/.npm-global"
    mkdir -p "$npm_config_prefix"
    ${pkgs.nodejs_22}/bin/npm install -g @anthropic-ai/claude-code @opencode-ai/opencode 2>/dev/null || true
  '';

  # Add npm global bin to PATH
  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "24.05";
}
