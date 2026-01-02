{
  description = "NixOS and Home Manager configuration for felix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Test rtkit 0.14 PR - remove after PR merges
    nixpkgs-rtkit-pr.url = "github:Gliczy/nixpkgs/rtkit";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixpkgs-rtkit-pr, home-manager, nix-darwin, catppuccin, nixos-hardware, ... }:
    let
      username = "felix";
    in
    {
      # NixOS system configurations
      nixosConfigurations = {
        thinkpad-p1 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-p1
            ./system/hosts/thinkpad-p1

            # Overlay to test rtkit 0.14 from PR #470633
            ({ config, pkgs, ... }: {
              nixpkgs.overlays = [
                (final: prev: {
                  rtkit = nixpkgs-rtkit-pr.legacyPackages.x86_64-linux.rtkit;
                })
              ];
            })
          ];
        };
      };

      # Home Manager configurations
      homeConfigurations = {
        # ThinkPad P1 Gen 6 (work laptop, Linux)
        "${username}@thinkpad-p1" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            catppuccin.homeModules.catppuccin
            ./home/hosts/thinkpad-p1.nix
          ];
        };

        # MacBook Pro (Apple Silicon)
        "${username}@macbook-pro" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [ ./home/hosts/macbook-pro.nix ];
        };
      };
    };
}
