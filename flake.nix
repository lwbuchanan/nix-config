{
	description = "My NixOS config flake with module for home-manager and nixvim";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

		home-manager.url = "github:nix-community/home-manager/release-24.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nixvim.url = "github:nix-community/nixvim/nixos-24.11";
		nixvim.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
	
		nixosConfigurations = {

			praxis = let
				username = "luke";
				specialArgs = { inherit username inputs; };
			in
				nixpkgs.lib.nixosSystem {
					inherit specialArgs;
					system = "x86_64-linux";

					modules = [
						./hosts/praxis
						./users/${username}/nixos.nix

						home-manager.nixosModules.home-manager {
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;

							home-manager.extraSpecialArgs = specialArgs;
							home-manager.users.${username} = import ./users/${username}/home.nix;
						}

					];
				};

		};
	};
}
