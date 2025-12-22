{ config, pkgs, ... }:

{
  imports = [
    ./session.nix
    ./fish.nix
    ./alacritty.nix
    ./nvim.nix
    ./claude.nix
    ./theme.nix
    ./darkman.nix
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

    # Build tools (for neovim treesitter)
    tree-sitter

    # Languages
    python3
    uv
    go

    # LSP servers and linters
    lua-language-server
    nil
    gopls
    golangci-lint
    pyright
    terraform-ls
    nodePackages.typescript-language-server

    # Git/GitHub
    gh

    # Utils
    bitwarden-cli
    yq
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
    includes = [
      {
        condition = "gitdir:~/Dev/work/";
        contents = {
          user.email = "felix.rosen@einride.tech";
        };
      }
    ];
  };

  # Delta (git pager)
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      side-by-side = true;
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
          pager = "delta --paging=never --side-by-side=false";
        }
      ];
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "25.05";
}
