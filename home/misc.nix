{ pkgs, ... }: 
{
	# Install all packages needed by the user (unless they are installed to the
	# system or need to be enabled as a program for further configuration).
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
	
	# Need to enable git so it can utilize the user's configuration
	programs.git = {
		enable = true;
	};

	# Similar to .bashrc
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
