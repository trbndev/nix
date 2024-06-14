{ lib, inputs, ... }:

{
  # Enable Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Allow unfree packages from stable and unstable branch
  inputs.nixpkgs.config.allowUnfree = lib.mkForce true;
  inputs.nixpkgs-stable.config.allowUnfree = lib.mkForce true;

  # Automatic garbe collection
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Manual optimise storage: nix-store --optimise
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  nix.channel.enable = false; # remove nix-channel related tools & configs, we use flakes instead.  
}