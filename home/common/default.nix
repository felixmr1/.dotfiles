{ config, pkgs, lib, ... }:

{
  imports = [
    ./fish.nix
    ./alacritty.nix
    ./nvim.nix
    ./claude.nix
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

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

    # Build tools (for neovim treesitter)
    tree-sitter

    # Languages
    python3
    uv
    go

    # LSP servers (for neovim)
    lua-language-server
    nil  # Nix LSP
    gopls
    pyright
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
    userName = "Felix Rosen";
    userEmail = "felix.m.rosen@gmail.com";
    delta = {
      enable = true;
      options = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
      };
    };
    includes = [
      {
        condition = "gitdir:~/Dev/work/";
        contents = {
          user = {
            email = "felix.todo@todo.com";
          };
        };
      }
    ];
  };

  # Lazygit configuration
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --paging=never";
        };
      };
    };
  };

  # Install npm packages on activation
  home.activation.installNpmPackages = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    export PATH="${pkgs.nodejs_22}/bin:$PATH"
    export npm_config_prefix="$HOME/.npm-global"
    mkdir -p "$npm_config_prefix"
    ${pkgs.nodejs_22}/bin/npm install -g @anthropic-ai/claude-code @opencode-ai/opencode || true
  '';

  # Add npm global bin to PATH
  home.sessionPath = [
    "$HOME/go/bin"
    "$HOME/.npm-global/bin"
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "25.05";
}
