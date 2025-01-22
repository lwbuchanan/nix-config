{ config, pkgs, ... }:

{

	# Configurations to be set system-wide. Mostly installations, most 
	# customizations should be managed per-user with home-manaer
  	imports = [ 
		../../modules/system.nix
		../../modules/gnome.nix
		../../modules/hyprland.nix
		../../modules/fonts.nix


		# Include the results of the hardware scan.
		./hardware-configuration.nix
    	];

  	# Bootloader.
	boot.loader = {
		efi = {
  			canTouchEfiVariables = true;
		};
		grub = {
			enable = true;
			efiSupport = true;
			useOSProber = true;
			devices = [ "nodev" ];
		};
	};

  	networking.hostName = "praxis"; # Define your hostname.

  	system.stateVersion = "24.11"; # Don't change me!
}
