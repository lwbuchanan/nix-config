{
	description = "My NixOS config flake";

	inputs = {
		# Upstream package source for nixpkgs (version 24.11).
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";

			# Ensures version match with nixpkgs in this flake
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
	
		nixosConfigurations = {

			praxis = let
				username = "luke";
				specialArgs = { inherit username; };
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

							home-manager.extraSpecialArgs = inputs // specialArgs;
							home-manager.users.${username} = import ./users/${username}/home.nix;
						}

					];
				};

		};
	};
}
