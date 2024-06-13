# THIS FILE IS NOT A SHELL-NIX FILE BUT THE BASE CONFIGURATION FOR MY SHELL
{ pkgs, ... }:

{
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    dash
  ];

  environment.binsh = "${pkgs.dash}/bin/dash";
}