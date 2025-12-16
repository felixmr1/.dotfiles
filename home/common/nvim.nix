{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Let LazyVim manage plugins - we just install neovim
    # Your existing config in ~/.config/nvim will be used automatically
  };

  # Ensure the nvim config directory exists
  # LazyVim expects its config at ~/.config/nvim
  # If you want to manage nvim config via Home Manager in the future,
  # you can use xdg.configFile to symlink or write configs
}
