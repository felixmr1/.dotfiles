{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Disable update news popup
      ecosystem = {
        no_update_news = true;
      };

      # Monitor (auto-detect)
      monitor = ",preferred,auto,1";

      # Autostart
      exec-once = [
        "waybar"
      ];

      # Input
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      # Appearance
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(88c0d0ee)";
        "col.inactive_border" = "rgba(4c566aee)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
      };

      animations = {
        enabled = true;
        bezier = "snappy, 0.05, 0.9, 0.1, 1.0";
        animation = [
          "windows, 1, 2, snappy"
          "windowsOut, 1, 2, snappy"
          "fade, 1, 2, snappy"
          "workspaces, 1, 2, snappy"
        ];
      };

      dwindle = {
        preserve_split = true;
      };

      # Keybindings
      "$mod" = "SUPER";

      bind = [
        # Apps
        "$mod, T, exec, alacritty"
        "$mod, E, exec, nautilus"
        "$mod, space, exec, wofi --show drun"

        # Window management
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod SHIFT, space, togglefloating"
        "$mod SHIFT, Q, exit"

        # Focus (vim-style)
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        # Move windows
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, l, movewindow, r"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, j, movewindow, d"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];

      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  # Waybar
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 28;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "pulseaudio" "network" "battery" "clock" "tray" ];

        clock.format = "{:%H:%M}";
        battery.format = "{capacity}% {icon}";
        network.format-wifi = "{essid} ";
        network.format-ethernet = "ETH";
        pulseaudio.format = "{volume}% ";
        tray.spacing = 8;
      };
    };
    style = ''
      * {
        font-family: "RobotoMono Nerd Font";
        font-size: 13px;
      }
      window#waybar {
        background: rgba(46, 52, 64, 0.9);
        color: #eceff4;
      }
      #workspaces button {
        padding: 0 6px;
        color: #d8dee9;
      }
      #workspaces button.active {
        background: #5e81ac;
        color: #eceff4;
      }
      #clock, #battery, #network, #pulseaudio, #tray {
        padding: 0 10px;
      }
    '';
  };
}
