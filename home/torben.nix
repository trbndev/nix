{ lib, config, pkgs, ... }:

{
  imports = [
    ./apps/vscode.nix
    ./apps/chrome.nix
    ./apps/firefox.nix
    ./config/git.nix
    ./config/shell.nix
    ./config/gnome.nix
  ];

  home = {
    username = "torben";
    homeDirectory = "/home/torben";
  };

  home.packages = with pkgs; [
    fastfetch
    tree

    # Proton
    protonvpn-gui
    protonmail-desktop
    # proton-pass # -> currently collision with protonmail-desktop

    # Graphics
    inkscape
    gimp
    pinta

    # Emulation
    qemu
    quickemu

    # Office
    libreoffice

    unzip

    ciscoPacketTracer8

    stable.obsidian
  ];

  programs.librewolf.enable = true;

  gtk.cursorTheme = pkgs.vanilla-dmz;

  # Enable home-manager
  programs.home-manager.enable = true;
  
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}