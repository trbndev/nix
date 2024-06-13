{ myLib, ... }: 

{
  imports = [
    ./nix.nix
    ./boot.nix
    ./networking.nix
    ./shell.nix
    ./packages.nix
    ./i18n.nix
  ];
}