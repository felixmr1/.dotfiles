{ config, pkgs, lib, ... }:

{
  imports = [
    ./common
  ];

  home = {
    username = "felix";
    homeDirectory = "/Users/felix";
  };

  # macOS packages
  home.packages = with pkgs; [
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
}
