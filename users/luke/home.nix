{pkgs, ...}: 
{
	# Pull in home manager and all needed home modules
	imports = [
		../../home/core.nix
		../../home/misc.nix
		../../home/hyprland
	];

	programs.git = {
		userName = "Luke Buchanan";
		userEmail = "luke1020will@gmail.com";
	};
}
