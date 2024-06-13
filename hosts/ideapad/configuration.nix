{ config, pkgs, pkgs-stable, ... }:

{
  imports =
    [ 
      ./hardware.nix
      ./../../modules/system/base
      ./../../modules/system/users/torben.nix
      ./../../modules/desktop/base.nix
      ./../../modules/desktop/kde.nix
    ];

  # Disk encryption
  boot.initrd.luks.devices."luks-949179a6-44cc-4fdb-b6da-4f85e54cc771".device = "/dev/disk/by-uuid/949179a6-44cc-4fdb-b6da-4f85e54cc771";
  
  # Hostname for IdeaPad
  networking.hostName = "ideapad";
  
  # FIX: IdeaPad does not fully shut down when this is not set.
  systemd.services.wpa_supplicant.serviceConfig.TimeoutSec = "10";
  
  system.stateVersion = "24.05";
}

