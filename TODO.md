# TODO

## System

- [ ] Upgrade rtkit to 0.14 when PR merges (fixes GNOME Shell crash on resume from suspend)
  - Current: 0.13 (lacks suspend/resume support)
  - Fixed in: 0.14 (released Dec 2025)
  - PR: https://github.com/NixOS/nixpkgs/pull/470633
  - Alternative: Apply systemd workaround or use PR branch with overlay
  - See: README.md "Known Issues" section
