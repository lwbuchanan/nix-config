{ pkgs, ... } :
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



  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
