{ ... }:

{
  catppuccin = {
    enable = true;
    flavor = "mocha";

    # Only enable for fish - gtk is handled in theme.nix
    fish.enable = true;
    gtk.enable = false;
  };
}
