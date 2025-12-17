{
  description = "NixOS and Home Manager configuration for felix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, ... }:
    let
      username = "felix";
    in
    {
      # NixOS system configurations
      nixosConfigurations = {
        nixos-vm = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./system/hosts/nixos-vm ];
        };
      };

      # Home Manager configurations
      homeConfigurations = {
        # Thinkpad X1 Carbon (work laptop, Linux)
        "${username}@thinkpad-x1-carbon" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./home/hosts/thinkpad-x1-carbon.nix ];
        };

        # MacBook Pro (Apple Silicon)
        "${username}@macbook-pro" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [ ./home/hosts/macbook-pro.nix ];
        };

        # NixOS VM (testing)
        "${username}@nixos-vm" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./home/hosts/nixos-vm.nix ];
        };
      };
    };
}
