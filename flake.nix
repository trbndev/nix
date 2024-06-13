{
  description = "@trbndev/nix - Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-stable, home-manager, ... }: 
  let 
    system = "x86_64-linux";
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      ideapad = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {   
          inherit pkgs-stable;
        };
        modules = [
          ./hosts/ideapad/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = { 
              inherit pkgs-stable;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.torben = import ./home/torben.nix;
          }
        ];
      };
    };
  };
}