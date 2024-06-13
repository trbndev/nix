{ lib, ... }:

{
  networking = {
    hostName = lib.mkDefault "nixos";

    hosts = {
      "127.0.0.1" = ["localhost"];
    };

    firewall.enable = true;


    networkmanager.enable = true;
  };
}