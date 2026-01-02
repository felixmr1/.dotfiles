# Dotfiles

NixOS + Home Manager configuration for multiple machines (Linux and macOS).

## Hosts

| Host | Platform | Usage |
|------|----------|-------|
| thinkpad-p1 | x86_64-linux | Work laptop (ThinkPad P1 Gen 6) |
| macbook-pro | aarch64-darwin | Personal Mac |

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

## DisplayLink (USB Docking Stations)

DisplayLink requires a proprietary driver blob that must be manually prefetched due to EULA requirements:

```bash
nix-prefetch-url --name displaylink-620.zip \
  https://www.synaptics.com/sites/default/files/exe_files/2025-09/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu6.2-EXE.zip
```

This is a one-time setup per machine. The driver will be cached in your Nix store for future rebuilds.

## Known Issues

### GNOME Shell crashes on resume from suspend

GNOME Shell restarts after waking from suspend due to rtkit-daemon's canary thread falsely detecting starvation during sleep. The daemon demotes real-time threads (including GNOME Shell's compositor) on resume, causing a crash.

**Root cause**: rtkit 0.13 lacks suspend/resume support. The fix was merged upstream in October 2023 and released in rtkit 0.14 (December 2025).

**Status**: nixpkgs still uses rtkit 0.13. Waiting for update to 0.14 or will apply systemd workaround.

**References**:
- [GitHub Issue #13](https://github.com/heftig/rtkit/issues/13)
- [Upstream fix PR](https://github.com/heftig/rtkit/pull/35)
- [rtkit GitLab](https://gitlab.freedesktop.org/pipewire/rtkit)

## Secrets

Secrets are managed via Bitwarden CLI and sourced from `~/.secrets.fish`:
