{ config, pkgs, lib, ... }:

let
  # Helper for disabling keybindings
  emptyKeybind = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
in
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
    # Remap Caps Lock to Escape
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "caps:escape" ];
    };

    # Wallpapers (light and dark mode)
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/felix/.dotfiles/media/denis-istomin-sky_light.jpg";
      picture-uri-dark = "file:///home/felix/.dotfiles/media/denis-istomin-eugenio_dark.jpg";
      picture-options = "zoom";
    };

    # Enable extensions
    "org/gnome/shell" = {
      enabled-extensions = [
        "pop-shell@system76.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    # Terminal shortcut and screen lock
    "org/gnome/settings-daemon/plugins/media-keys" = {
      terminal = emptyKeybind;  # Disable default, use custom
      home = ["<Super>e"];
      screensaver = ["<Super>Escape"];
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
      minimize = emptyKeybind;  # Frees Super+h for Pop Shell focus-left

      close = ["<Super>q"];
      maximize = ["<Super>m"];

      # Workspace navigation (h/l for GNOME 40+ horizontal workspaces)
      switch-to-workspace-left = ["<Super><Ctrl>Left" "<Super><Ctrl>h"];
      switch-to-workspace-right = ["<Super><Ctrl>Right" "<Super><Ctrl>l"];
      switch-to-workspace-up = emptyKeybind;
      switch-to-workspace-down = emptyKeybind;

      # Direct workspace switching (Super+1-9)
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];

      # Move window to workspace
      move-to-workspace-left = ["<Super><Shift>Left" "<Super><Shift>h"];
      move-to-workspace-right = ["<Super><Shift>Right" "<Super><Shift>l"];
      move-to-workspace-up = emptyKeybind;
      move-to-workspace-down = emptyKeybind;

      # Move window to specific workspace (Super+Shift+1-9)
      move-to-workspace-1 = ["<Super><Shift>1"];
      move-to-workspace-2 = ["<Super><Shift>2"];
      move-to-workspace-3 = ["<Super><Shift>3"];
      move-to-workspace-4 = ["<Super><Shift>4"];
      move-to-workspace-5 = ["<Super><Shift>5"];
      move-to-workspace-6 = ["<Super><Shift>6"];
      move-to-workspace-7 = ["<Super><Shift>7"];
      move-to-workspace-8 = ["<Super><Shift>8"];
      move-to-workspace-9 = ["<Super><Shift>9"];

      # Move window between displays (j/k since h/l is workspace nav)
      move-to-monitor-left = emptyKeybind;
      move-to-monitor-right = emptyKeybind;
      move-to-monitor-up = ["<Super><Shift>Up" "<Super><Shift>k"];
      move-to-monitor-down = ["<Super><Shift>Down" "<Super><Shift>j"];
    };

    # Fixed 9 workspaces for reliable numbered switching
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };

    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 9;
    };

    # Disable mutter half-screen snap (Pop Shell handles tiling)
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = emptyKeybind;
      toggle-tiled-right = emptyKeybind;
    };

    # Pop Shell settings (official Pop!_OS defaults with vim keys)
    "org/gnome/shell/extensions/pop-shell" = {
      tile-by-default = false;
      tile-enter = ["<Super>Return"];
      toggle-stacking = ["<Super>s"];
      toggle-floating = ["<Super>g"];
      tile-orientation = ["<Super>o"];

      # Focus with Super+hjkl
      focus-left = ["<Super>Left" "<Super>h"];
      focus-right = ["<Super>Right" "<Super>l"];
      focus-up = ["<Super>Up" "<Super>k"];
      focus-down = ["<Super>Down" "<Super>j"];

      # Disable Pop Shell's tile-move (frees Super+Shift+hjkl for GNOME)
      # GNOME handles: H/L = workspace left/right, J/K = monitor up/down
      tile-move-left = emptyKeybind;
      tile-move-right = emptyKeybind;
      tile-move-up = emptyKeybind;
      tile-move-down = emptyKeybind;
    };

    # Launcher and disable Super+number for dock apps (frees for workspace switching)
    "org/gnome/shell/keybindings" = {
      toggle-application-view = ["<Super>a"];
      switch-to-application-1 = emptyKeybind;
      switch-to-application-2 = emptyKeybind;
      switch-to-application-3 = emptyKeybind;
      switch-to-application-4 = emptyKeybind;
      switch-to-application-5 = emptyKeybind;
      switch-to-application-6 = emptyKeybind;
      switch-to-application-7 = emptyKeybind;
      switch-to-application-8 = emptyKeybind;
      switch-to-application-9 = emptyKeybind;
    };

  };
}
