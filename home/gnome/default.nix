{ pkgs, ... }:
{
	# Declares some settings
	dconf.enable = true;
  	dconf.settings = {
       		"org/gnome/mutter" = { 
			edge-tiling = true; 
			experimental-features = [ 
				"scale-monitor-framebuffer"
				"xwayland-native-scaling" 
			];
		};
    		"org/gnome/desktop/interface" = {
      			color-scheme = "prefer-dark";
			enable-hot-corners = false;
			scaling-factor = 1.5;
    		};
  	};

}
