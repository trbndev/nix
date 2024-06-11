{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./apps/vscode.nix
    ./apps/chrome.nix
    ./apps/firefox.nix
    ./config/git.nix
    ./config/shell.nix
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
    # proton-pass # Not yet in unstable or stable

    # Graphics
    inkscape
    gimp

    # vmware-workstation

    # Office
    obsidian
    libreoffice

    unzip
  ];



  # Enable home-manager
  programs.home-manager.enable = true;
  
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}