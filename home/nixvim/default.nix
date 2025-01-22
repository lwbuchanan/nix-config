{pkgs, inputs, ...}:
{
	imports = [ 

		# Import nixvim from its source in the flake
		inputs.nixvim.homeManagerModules.nixvim 

		# Plugins
		./plugins/colors.nix
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;

		globals = {
		        mapleader = " ";
		        maplocalleader = " ";
		        # Set to true if you have a Nerd Font installed and selected in the terminal
			have_nerd_font = false;
		};
	};
}
