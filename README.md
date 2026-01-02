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

### GNOME Shell crashes on resume from suspend (TESTING FIX)

**Issue**: GNOME Shell restarts after waking from suspend due to rtkit-daemon's canary thread falsely detecting starvation during sleep. The daemon demotes real-time threads (including GNOME Shell's compositor) on resume, causing a crash.

**Root cause**: rtkit 0.13 lacks suspend/resume support. The fix was merged upstream in October 2023 and released in rtkit 0.14 (December 2025).

**Current status**: Testing rtkit 0.14 via flake overlay from [PR #470633](https://github.com/NixOS/nixpkgs/pull/470633). The overlay pulls rtkit from `github:Gliczy/nixpkgs/rtkit` and applies it system-wide. **This overlay MUST be removed once the PR merges into nixpkgs.**

**To remove the overlay** (after PR merges):
1. Remove the `nixpkgs-rtkit-pr` input from `flake.nix`
2. Remove the `nixpkgs-rtkit-pr` parameter from outputs
3. Remove the overlay module from `nixosConfigurations.thinkpad-p1.modules`
4. Run `nix flake update` and `sudo nixos-rebuild switch`

**References**:
- [nixpkgs PR #470633 (rtkit 0.14)](https://github.com/NixOS/nixpkgs/pull/470633)
- [GitHub Issue #13](https://github.com/heftig/rtkit/issues/13)
- [Upstream fix](https://github.com/heftig/rtkit/pull/35)
- [rtkit GitLab](https://gitlab.freedesktop.org/pipewire/rtkit)

## Secrets

Secrets are managed via Bitwarden CLI and sourced from `~/.secrets.fish`:
