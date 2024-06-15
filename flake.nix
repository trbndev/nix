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
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    commonArgs = {
      inherit inputs pkgs-stable;
    };
  in {
    nixosConfigurations = {
      ideapad = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = commonArgs;

        modules = [
          ./hosts/ideapad/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = commonArgs;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.torben = import ./home/torben.nix;
          }
        ];
      };
    };
  };
}