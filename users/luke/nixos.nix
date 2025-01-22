{
	# Declare platform independent user information
  	users.users.luke = {
    		description = "Luke";

    		# Secrets not set up through nix, this will need to be replaced with new key pair or copy over private key from old machine
    		openssh.authorizedKeys.keys = [
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMcO+GRgvOCNhzPEiC/3FJLZvUMykTbkw3ugC7eHlasP luke@praxis"
    		];
  	};

}
