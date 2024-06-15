{ ... }:

{
  # Enable the Gnome Desktop Environment.
  services.xserver.displayManager.gddm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
}