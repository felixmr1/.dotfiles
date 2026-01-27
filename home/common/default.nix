{ config, pkgs, ... }:

{
  imports = [
    ./session.nix
    ./fish.nix
    ./alacritty.nix
    ./nvim.nix
    ./claude.nix
    ./theme.nix
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Allow unfree packages (claude-code, etc.)
  nixpkgs.config.allowUnfree = true;

  # Packages installed to user profile
  home.packages = with pkgs; [
    # CLI tools
    lazydocker
    nodejs_22
    htop
    jq
    fd
    fzf
    ripgrep
    opencode

    # GUI tools
    vscode

    # Build tools (for neovim treesitter)
    tree-sitter

    # Languages
    python3
    uv
    go

    # LSP servers and linters
    lua-language-server
    nixd
    nixfmt-rfc-style
    gopls
    golangci-lint
    pyright
    terraform-ls
    nodePackages.typescript-language-server

    # Utils
    bitwarden-cli
    yq
    gh
    mermaid-cli
  ];

  # Git configuration
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Felix Rosen";
        email = "felix.m.rosen@gmail.com";
      };
    };
  };

  # Delta (git pager)
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      line-numbers = true;
    };
  };

  # Lazygit configuration
  programs.lazygit = {
    enable = true;
    settings = {
      git.pagers = [
        {
          colorArg = "always";
          pager = "delta --paging=never";
        }
      ];
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "25.05";
}
