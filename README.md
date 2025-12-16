# Dotfiles

Home Manager configuration for macOS and NixOS.

## Installation

### 1. Install Nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### 2. Apply configuration

```bash
# Thinkpad X1 Carbon (work)
home-manager switch --flake ~/.dotfiles#felix@thinkpad-x1-carbon

# MacBook Pro
home-manager switch --flake ~/.dotfiles#felix@macbook-pro

# NixOS VM (testing)
home-manager switch --flake ~/.dotfiles#felix@nixos-vm
```

## Secrets

Secrets are managed via Bitwarden CLI and sourced from `~/.secrets.fish`:

```bash
bw get notes "api-keys" > ~/.secrets.fish
chmod 600 ~/.secrets.fish
```
