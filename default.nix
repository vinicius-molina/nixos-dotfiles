{config, pkgs, ...}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    rxvt_unicode
    home-manager
  ];

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;


  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  
  # environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivation to /run/current-system/sw
  services.xserver = {
    enable = true;
    layout = "us";
      autorun = true;

      displayManager.lightdm.enable = true;

      desktopManager = {
        default = "none";
        xterm.enable = false;
      };

      windowManager.i3 = {
	enable = true;
	extraPackages = with pkgs; [
          dmenu # application launcher
	  i3status # default i3 status bar
	  i3lock # default i3 screen locker
	  #i3blocks #substitui o i3status
	];
      };
  };

}
