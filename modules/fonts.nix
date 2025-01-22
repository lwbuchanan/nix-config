{ pkgs, ... }: 
{
	# Includes all the necessities for unicode, international, icons, programming, etc.
	fonts = {
		enableDefaultFonts = true;
		packages = with pkgs; [
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-emoji
			nerdfonts
		];
		fontconfig = {
			defaultFonts = {
				emoji = [ "Noto Emoji Color" ];
				serif = [ "Noto Serif" ];
				sansSerif = [ "Noto Sans" ];
			};
		};

	};


}
