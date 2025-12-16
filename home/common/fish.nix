{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    # Abbreviations (expand on space)
    shellAbbrs = {
      gs = "git status";
      ld = "lazydocker";
      lg = "lazygit";
    };

    # Environment variables
    shellInit = ''
      # GPG signing for git commits
      set -gx GPG_TTY (tty)
    '';

    interactiveShellInit = ''
      # Disable greeting
      set fish_greeting

      # Source secrets (API keys, tokens - not in version control)
      test -f "$HOME/.secrets.fish"; and source "$HOME/.secrets.fish"

      # Source local/work-specific config if exists
      test -f "$HOME/.config/fish/local.fish"; and source "$HOME/.config/fish/local.fish"

      # Pure prompt configuration
      set pure_symbol_prompt "❯"
      set pure_symbol_reverse_prompt "❮"
      set pure_symbol_git_dirty "*"
      set pure_symbol_git_stash "≡"
      set pure_symbol_git_unpulled_commits "⇣"
      set pure_symbol_git_unpushed_commits "⇡"

      # Pure colors
      set pure_color_primary blue
      set pure_color_info cyan
      set pure_color_mute brblack
      set pure_color_success magenta
      set pure_color_danger red
      set pure_color_warning yellow

      # Pure features
      set pure_enable_git true
      set pure_enable_virtualenv true
      set pure_show_system_time false
      set pure_check_for_new_release false
      set pure_reverse_prompt_symbol_in_vimode true
    '';

    # Fish plugins
    plugins = [
      {
        name = "pure";
        src = pkgs.fishPlugins.pure.src;
      }
    ];

    # Fish functions
    functions = {
      # Auto-activate/deactivate Python virtual environments
      _check_venv = {
        onVariable = "PWD";
        body = ''
          # Check if we're still inside the current venv's project
          if test -n "$VIRTUAL_ENV"
              set -l venv_root (dirname $VIRTUAL_ENV)
              if not string match -q "$venv_root*" "$PWD"
                  deactivate
              end
          end

          # Activate .venv if present and not already active
          if test -d ".venv"; and test "$VIRTUAL_ENV" != "$PWD/.venv"
              source .venv/bin/activate.fish
          end
        '';
      };
    };
  };

  # Set default editor
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Add paths
  home.sessionPath = [
    "$HOME/go/bin"
  ];
}
