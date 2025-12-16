# Dotfiles

NixOS + Home Manager configuration for multiple machines (Linux and macOS).

## Structure

- `flake.nix` - Nix flake with nixosConfigurations and homeConfigurations
- `system/` - NixOS system-level configuration
  - `common/` - Shared system config (audio, bluetooth, fonts)
  - `desktop/` - Desktop environments (gnome, hyprland)
  - `hosts/` - Machine-specific system config
- `home/` - Home Manager user-level configuration
  - `common/` - Shared user config (fish, alacritty, nvim)
  - `hosts/` - Machine-specific user config
  - `linux.nix` - Linux-specific packages
  - `macos.nix` - macOS-specific config

## Hosts

| Host | Platform | Usage |
|------|----------|-------|
| thinkpad-x1-carbon | x86_64-linux | Work laptop |
| macbook-pro | aarch64-darwin | Personal Mac |
| nixos-vm | x86_64-linux | Testing VM |

## Commands

```bash
# NixOS system rebuild
sudo nixos-rebuild switch --flake ~/.dotfiles#nixos-vm

# Home Manager switch
home-manager switch --flake ~/.dotfiles#felix@<host>
```

## Conventions

- Cross-platform packages go in `home/common/default.nix`
- Linux-only packages go in `home/linux.nix`
- macOS-only packages go in `home/macos.nix`
- Mason is disabled; LSP servers installed via Nix
- Neovim config is symlinked (writable) not copied to Nix store
- Secrets sourced from `~/.secrets.fish` (not in repo)
