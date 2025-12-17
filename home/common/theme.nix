{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-blue-standard+default";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "blue" ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  # Install both variants for darkman to switch between
  home.packages = with pkgs; [
    (catppuccin-gtk.override { variant = "latte"; accents = [ "blue" ]; })
    (catppuccin-gtk.override { variant = "mocha"; accents = [ "blue" ]; })
  ];

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    gtk-theme = "catppuccin-mocha-blue-standard+default";
  };
}
