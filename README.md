# Dotfiles

NixOS + Home Manager configuration for multiple machines (Linux and macOS).

## Hosts

| Host | Platform | Usage |
|------|----------|-------|
| thinkpad-p1 | x86_64-linux | Work laptop (ThinkPad P1 Gen 6) |
| macbook-pro | aarch64-darwin | Personal Mac |
| nixos-vm | x86_64-linux | Testing VM |

## Installation

### NixOS

```bash
# System configuration
sudo nixos-rebuild switch --flake ~/.dotfiles#thinkpad-p1

# User configuration
home-manager switch --flake ~/.dotfiles#felix@thinkpad-p1
```

### macOS

```bash
# Install Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# User configuration
home-manager switch --flake ~/.dotfiles#felix@macbook-pro
```

## Secrets

Secrets are managed via Bitwarden CLI and sourced from `~/.secrets.fish`:
