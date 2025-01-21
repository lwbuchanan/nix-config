{
	pkgs, ...
}: {
	xresources.properties = {
		"Xcursor.size" = 16;
		"Xft.dpi" = 144;
	};

	home.packages = with pkgs; [
		# User-level utilities
		ranger
		zip
		unzip
		ripgrep
		eza
		zoxide
		fzf
		fastfetch
		btop
	];

	# Userspace program configurations (~/.config stuff)

	programs.kitty = {
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
		};
	};

}
