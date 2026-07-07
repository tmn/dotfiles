{
  description = "Tris dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  
    darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, darwin, home-manager, ... }:
  let
    users = import ./metadata/users.nix;

    mkDarwinConfig = { hostname, username }:
      let
        user =
          users.${username}
            or (throw "flake.nix: no user profile for '${username}' (machine '${hostname}') in metadata/users.nix");
      in
      darwin.lib.darwinSystem {
        modules = [
          home-manager.darwinModules.home-manager
          ./common/common.nix
          ./machines/${hostname}
        ];
        specialArgs = { inherit inputs username user; };
      };
  in
  {
    darwinConfigurations = {
      tequila = mkDarwinConfig { hostname = "tequila"; username = "tmn"; };
      mini = mkDarwinConfig { hostname = "mini"; username = "tmn"; };
    };
  };
}