{ pkgs, ... } :
{
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
	};
	
	# Stuff needed for hyprland to work regardless of user config
	environment.systemPackages = with pkgs; [ 
		kitty
		waybar
		wofi
	];
}
