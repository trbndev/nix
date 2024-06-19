{ pkgs, ... }:

{
  gtk.enable = true;
  
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";
  
  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";

  gtk.iconTheme.package = pkgs.gruvbox-plus-icons;
  gtk.iconTheme.name = "GruvboxPlus";

  dconf = {
    enable = true;
  
    settings = {
      # Gnome Core Settings
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.gsconnect.extensionUuid
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.dash-to-dock.extensionUuid
        ];

        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "firefox.desktop"
        ];
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };

      # Extension Settings
      "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = 32;
      };

    };
  };
}