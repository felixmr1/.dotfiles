{ config, pkgs, lib, ... }:

{
  dconf.settings = {
    # Terminal shortcut
    "org/gnome/settings-daemon/plugins/media-keys" = {
      terminal = ["<Super>t"];
      home = ["<Super>e"];
    };

    # Window management
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      maximize = ["<Super>m"];
      minimize = ["<Super>h"];
      switch-to-workspace-up = ["<Super><Ctrl>Up" "<Super>Page_Up"];
      switch-to-workspace-down = ["<Super><Ctrl>Down" "<Super>Page_Down"];
      move-to-workspace-up = ["<Super><Shift><Ctrl>Up" "<Super><Shift>Page_Up"];
      move-to-workspace-down = ["<Super><Shift><Ctrl>Down" "<Super><Shift>Page_Down"];
    };

    # Pop Shell settings
    "org/gnome/shell/extensions/pop-shell" = {
      tile-by-default = true;
      toggle-tiling = ["<Super>y"];
      toggle-floating = ["<Super>g"];
      tile-orientation = ["<Super>o"];
      tile-move-left = ["<Super><Shift>Left"];
      tile-move-right = ["<Super><Shift>Right"];
      tile-move-up = ["<Super><Shift>Up"];
      tile-move-down = ["<Super><Shift>Down"];
      tile-resize-left = ["<Super><Ctrl>Left"];
      tile-resize-right = ["<Super><Ctrl>Right"];
      tile-resize-up = ["<Super><Ctrl>Up"];
      tile-resize-down = ["<Super><Ctrl>Down"];
    };

    # Launcher
    "org/gnome/shell/keybindings" = {
      toggle-application-view = ["<Super>a"];
    };

    # Tiling with Super+Arrow
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = ["<Super>Left"];
      toggle-tiled-right = ["<Super>Right"];
    };
  };
}
