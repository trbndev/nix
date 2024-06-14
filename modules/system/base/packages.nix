{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fastfetch

    bat
    git

    nixd
  ];
}