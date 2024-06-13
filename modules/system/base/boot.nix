{ pkgs, ... }:

{
  # Bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };

  # Linux Kernel  
  boot.kernelPackages = pkgs.linuxPackages_latest;
}