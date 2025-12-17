{ config, pkgs, lib, ... }:

{
  # Set default applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = [ "nvim.desktop" ];
      "text/x-script" = [ "nvim.desktop" ];
    };
  };

  dconf.settings = {
    # Enable extensions
    "org/gnome/shell" = {
      enabled-extensions = [
        "pop-shell@system76.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    # Terminal shortcut (uses custom command for Alacritty)
    "org/gnome/settings-daemon/plugins/media-keys" = {
      terminal = [];  # Disable default, use custom
      home = ["<Super>e"];
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      command = "alacritty";
      binding = "<Super>t";
    };

    # Default terminal for GNOME
    "org/gnome/desktop/applications/terminal" = {
      exec = "alacritty";
    };

    # Preferred text editor
    "org/gnome/desktop/applications/editor" = {
      exec = "nvim";
    };

    # Window management
    "org/gnome/desktop/wm/keybindings" = {
      # Disable GNOME defaults that conflict with Pop Shell
      minimize = [];  # Frees Super+h for Pop Shell focus-left

      close = ["<Super>q"];
      maximize = ["<Super>m"];

      # Workspace navigation (h/l for GNOME 40+ horizontal workspaces)
      switch-to-workspace-left = ["<Super><Ctrl>Left" "<Super><Ctrl>h"];
      switch-to-workspace-right = ["<Super><Ctrl>Right" "<Super><Ctrl>l"];
      switch-to-workspace-up = [];    # Disable, we use left/right
      switch-to-workspace-down = [];

      # Move window to workspace
      move-to-workspace-left = ["<Super><Shift>Left" "<Super><Shift>h"];
      move-to-workspace-right = ["<Super><Shift>Right" "<Super><Shift>l"];
      move-to-workspace-up = [];      # Disable, we use left/right
      move-to-workspace-down = [];

      # Move window between displays (j/k since h/l is workspace nav)
      move-to-monitor-up = ["<Super><Shift>Up" "<Super><Shift>k"];
      move-to-monitor-down = ["<Super><Shift>Down" "<Super><Shift>j"];
    };

    # Disable mutter half-screen snap (Pop Shell handles tiling)
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    # Pop Shell settings (official Pop!_OS defaults with vim keys)
    "org/gnome/shell/extensions/pop-shell" = {
      tile-by-default = true;
      tile-enter = ["<Super>Return"];
      toggle-stacking = ["<Super>s"];
      toggle-floating = ["<Super>g"];
      tile-orientation = ["<Super>o"];
      # Focus with Super+hjkl or Super+arrows
      focus-left = ["<Super>Left" "<Super>h"];
      focus-right = ["<Super>Right" "<Super>l"];
      focus-up = ["<Super>Up" "<Super>k"];
      focus-down = ["<Super>Down" "<Super>j"];
    };

    # Launcher
    "org/gnome/shell/keybindings" = {
      toggle-application-view = ["<Super>a"];
    };

  };
}
