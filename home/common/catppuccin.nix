{ ... }:

{
  catppuccin = {
    enable = true;
    flavor = "mocha";

    # Only enable for fish
    # nvim is managed separately via symlink to dotfiles
    fish.enable = true;
    nvim.enable = false;
  };
}
