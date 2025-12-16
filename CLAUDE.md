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

## Git Commits

Follow conventional commits: `type(scope): message`

Types:
- `feat` - new feature
- `fix` - bug fix
- `chore` - maintenance, dependencies
- `refactor` - code restructuring
- `docs` - documentation

Scopes: `nvim`, `fish`, `alacritty`, `gnome`, `hyprland`, `system`, `home`, etc.

Examples:
- `feat(nvim): add lsp config`
- `fix(fish): prompt colors`
- `chore(home): update packages`

No Claude Code branding or co-author tags.

## Conventions

- Cross-platform packages go in `home/common/default.nix`
- Linux-only packages go in `home/linux.nix`
- macOS-only packages go in `home/macos.nix`
- Mason is disabled; LSP servers installed via Nix
- Neovim config is symlinked (writable) not copied to Nix store
- Secrets sourced from `~/.secrets.fish` (not in repo)
