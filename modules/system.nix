{ pkgs, 
  lib, 
  username, 
  ... }: 
{
	# System configuration: 
	# These are host-agnostic configurations that should be installed on all my machines.
	# Individual settings can be broken into system modules on an as-needed basis
	# for the sake of flexibility and better organization.


	# Locale Stuff
	time.timeZone = "America/Indiana/Indianapolis";
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
	  LC_ADDRESS = "en_US.UTF-8";
	  LC_IDENTIFICATION = "en_US.UTF-8";
	  LC_MEASUREMENT = "en_US.UTF-8";
	  LC_MONETARY = "en_US.UTF-8";
	  LC_NAME = "en_US.UTF-8";
	  LC_NUMERIC = "en_US.UTF-8";
	  LC_PAPER = "en_US.UTF-8";
	  LC_TELEPHONE = "en_US.UTF-8";
	  LC_TIME = "en_US.UTF-8";
	};


	# Enable networking
	networking.networkmanager.enable = true;

	# Enable CUPS to print documents.
	services.printing.enable = true;

	# Enable sound with pipewire.
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
	  enable = true;
	  alsa.enable = true;
	  alsa.support32Bit = true;
	  pulse.enable = true;
	  #jack.enable = true;

	  #media-session.enable = true;
	};

	# Enable touchpad support (enabled default in most desktopManager).
	services.xserver.libinput.enable = true;

	# Define the main admin user. Make sure to give them a password before trying to log in.
	users.users.${username} = {
		isNormalUser = true;
		extraGroups = [ "networkmanager" "wheel" ];
	};

	# Needed for this flake-based config
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# These are packages that should / need to be installed for all users.
	# Unconfigured editors, essential cli tools, stuff you would expect 
	# to find in an unconfigured distro.
	environment.systemPackages = with pkgs; [
		git
		vim 
		wget
		alacritty
	];

	# System services
	services.openssh.enable = true;


	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

}
