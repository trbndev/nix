{ lib, inputs, ... }:

{
  # Enable Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Use stable and unstable branches with unfree packages
  nixpkgs.overlays = [
    (final: prev: {
      stable = import inputs.nixpkgs-stable {
        system = prev.system;
        config.allowUnfree = true;
      };
    })
  ];
  nixpkgs.config.allowUnfree = lib.mkForce true;

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