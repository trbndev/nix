{ pkgs, ... }:

{
  users.users.torben = {
    initialPassword = "root"; # Initial password, should be changed afer installation with `passwd`
    isNormalUser = true;
    description = "Torben Haack";
    extraGroups = [ "torben" "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}