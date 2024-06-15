{ pkgs, ... }:

{
  # Enable the Gnome Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-dock
  ];
}