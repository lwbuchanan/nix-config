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

			praxis = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				
				# This allows all input parameters to be used as special arguments in
				# all submodules. This is needed to use dependencies as module inputs.
				specialArgs = { inherit inputs; };
				modules = [
					# Monolithic config file
					./configuration.nix

					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.luke = import ./home.nix;
					}

				];
			};

		};
	};
}
