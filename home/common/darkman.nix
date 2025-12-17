{ pkgs, ... }:

{
  services.darkman = {
    enable = true;
    settings.usegeoclue = true;

    darkModeScripts.gtk-theme = ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'catppuccin-mocha-blue-standard+default'"
    '';

    lightModeScripts.gtk-theme = ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'catppuccin-latte-blue-standard+default'"
    '';
  };
}
