{ username, ... }:

{
	# Setup home-manager for the given user
	home = {
		inherit username;
		homeDirectory = "/home/${username}";
		stateVersion = "24.11"; # Don't change this!
	};

 	# Let home Manager install and manage itself.
  	programs.home-manager.enable = true;
}
