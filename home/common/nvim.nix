{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Symlink nvim config from dotfiles
  xdg.configFile."nvim" = {
    source = ./config/nvim;
    recursive = true;
  };
}
