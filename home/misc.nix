{
	pkgs, ...
}: {
	#xresources.properties = {
	#	"Xcursor.size" = 16;
	#	"Xft.dpi" = 144;
	#};

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

	home.packages = with pkgs; [
		ranger
		zip
		unzip
		ripgrep
		eza
		zoxide
		fzf
		fastfetch
		btop

		xournalpp
		discord
		jetbrains.idea-ultimate

		typst
		plantuml
		zathura
	];

	# Userspace program configurations (~/.config stuff)

	programs.kitty = {
		enable = true;
	};

	programs.foot = {
		enable = true;
	};

	programs.git = {
		enable = true;
	};

	programs.bash = {
		enable = true;
		enableCompletion = true;
		bashrcExtra =
		''
			eval "$(zoxide init bash)"
		'';
		shellAliases = {
			ls = "eza --git --icons=auto --group-directories-first";
			ll = "ls -l";
			lr = "ls -lT -L 2";
			la = "ls -la";
			lar = "ls -laT -L 2";

			v = "nvim";
			sv = "sudoedit";
			nf = "fastfetch";
			cd = "z";
			grep = "grep --color=auto";
			renix = "sudo nixos-rebuild switch --flake ~/nix-config";
		};
	};

}
