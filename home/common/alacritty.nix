{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      # Window settings
      window = {
        opacity = 1.0;
        decorations = "None";  # Hide title bar
      };

      # Font configuration
      font = {
        size = 11;
        normal = {
          family = "RobotoMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "RobotoMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "RobotoMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "RobotoMono Nerd Font";
          style = "Bold Italic";
        };
      };

      # GitHub Dark color scheme
      colors = {
        primary = {
          background = "0x30363d";
          foreground = "0xe6edf3";
        };
        cursor = {
          cursor = "0xe6edf3";
          text = "0x30363d";
        };
        normal = {
          black = "0x484f58";
          red = "0xff7b72";
          green = "0x3fb950";
          yellow = "0xd29922";
          blue = "0x58a6ff";
          magenta = "0xbc8cff";
          cyan = "0x39c5cf";
          white = "0xb1bac4";
        };
        bright = {
          black = "0x6e7681";
          red = "0xffa198";
          green = "0x56d364";
          yellow = "0xe3b341";
          blue = "0x79c0ff";
          magenta = "0xbc8cff";
          cyan = "0x39c5cf";
          white = "0xb1bac4";
        };
      };

      # Keyboard bindings
      keyboard = {
        bindings = [
          {
            key = "F";
            mods = "Control";
            action = "ToggleViMode";
          }
        ];
      };
    };
  };
}
