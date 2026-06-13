{
  description = "Cyanide's (not-so-ultimate) Ultimate NixOS Flake";

  # Where Nix fetches things - I am going for rolling release (unstable)
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    terax.url = "github:crynta/terax-ai"; # The github for terax ai editor so that the module works

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; # Forces home manager to use nixpkgs version
    };
  };

  # How Nix assembles the environment
  outputs = { self, nixpkgs, home-manager, terax, ... }@inputs: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Passes inputs down to config files
        modules = [
          ./hosts/laptop/configuration.nix
          
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.cyanide = import ./cyanide/home.nix;
          }
        ];
      };
    };
  };
}
