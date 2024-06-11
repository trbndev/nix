{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware.nix
      ./../../modules/desktop/base.nix
      ./../../modules/desktop/kde.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };
  boot.initrd.luks.devices."luks-949179a6-44cc-4fdb-b6da-4f85e54cc771".device = "/dev/disk/by-uuid/949179a6-44cc-4fdb-b6da-4f85e54cc771";
  networking.hostName = "ideapad"; # Define your hostname.
  
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # Enable networking
  networking.networkmanager.enable = true;
  
  # Fix shutdown bug
  systemd.services.wpa_supplicant.serviceConfig.TimeoutSec = "10";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.torben = {
    isNormalUser = true;
    description = "Torben Haack";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
    shell = pkgs.zsh;
  };
  
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    dash
  ];

  environment.binsh = "${pkgs.dash}/bin/dash";

  system.stateVersion = "24.05";
}

