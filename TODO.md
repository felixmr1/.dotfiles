# TODO

## System

- [ ] Upgrade rtkit to 0.14 when available in nixpkgs (fixes GNOME Shell crash on resume from suspend)
  - Current: 0.13 (lacks suspend/resume support)
  - Fixed in: 0.14 (released Dec 2025)
  - Alternative: Apply systemd workaround to stop/restart rtkit during sleep
  - See: README.md "Known Issues" section
