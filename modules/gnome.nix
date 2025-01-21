{ pkgs, config, ... } :
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Extensions
  environment.systemPackages = with pkgs.gnomeExtensions; [
	blur-my-shell
	burn-my-windows
  ];

  #dconf = {
  #      enable = true;
  #      settings = {
  #      	"org/gnome/shell" = {
  #      		disable-user-extensions = false;
  #      		enabled-extensions = [
  #      			pkgs.gnomeExtensions.blur-my-shell.extensionUuid
  #      		];
  #      	};
  #      	"org/gnome/mutter" = {
  #      		experimental-features = "['scale-monitor-framebuffer']";
  #      	};

  #      };
  #};

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
