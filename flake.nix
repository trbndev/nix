{
  description = "@trbndev/nix - Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: 
  let 
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      ideapad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {   
          inherit inputs outputs; 
        };
        modules = [
          ./hosts/ideapad/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = { inherit inputs outputs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.torben = import ./home/torben.nix;
          }
        ];
      };
    };
  };
}