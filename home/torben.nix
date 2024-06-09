# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  home = {
    username = "torben";
    homeDirectory = "/home/torben";
  };

  home.packages = with pkgs; [
    fastfetch
    protonvpn-gui
    inkscape
    obsidian
  ];

  programs.chromium = {
    enable = true;
    extensions = [
      { id = "epcnnfbjfcgphgdmggkamkmgojdagdnn"; } # uBlock Origin
      { id = "edibdbjcniadpccecjdfdjjppcpchdlm"; } # I still don't care about cookies
      { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # Privacy Badger
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # Proton Pass
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # Sponsor Block
      { id = "ifnkdbpmgkdbfklnbfidaackdenlmhgh"; } # PopUpOFF
    ];
  };

  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
  };

  programs.git = {
    enable = true;
    userName = "Torben Haack";
    userEmail = "tohaack@pm.me";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      seatonjiang.gitmoji-vscode
    ];
  };

  # Enable home-manager
  programs.home-manager.enable = true;
  
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}