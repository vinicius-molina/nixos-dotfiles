{config, pkgs, ...}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    # system utils
    #unzip
    #wget
    #htop
    git
    neovim
    kitty
    #wpa_supplicant_gui
    
    # my system
    firefox
    chromium
    ranger
    feh
    rofi
    ncmpcpp
    cmus
    mpv
    youtube-dl
    compton
    xwinwrap
    zsh
    oh-my-zsh
    libreoffice
    
    # dev
    #vscode # unfree
    gcc
    linuxHeaders
    cmake
    gnumake
    elixir
    yarn
    nodejs
    python3
    python2
    nerdfonts
    python37Packages.powerline
    powerline-fonts
    fzf
    silver-searcher
    
    # etc
    krita
    postgresql
    inotify-tools
    
    # games
    #steam # unfree
    #wine
  ];

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

  services.compton = {
    enable = true;
    activeOpacity = "0.9";
    inactiveOpacity = "0.85";
    menuOpacity = "0.95";
    shadowExclude = [
      "! name ~= ''"
      "class_g *?= 'firefox'"
      "class_g *?= 'brave'"
      "name ~= 'Firefox$'"
      "name *= 'Chromium'"
      "name *= 'Chrome'"
      "name = 'Notification'"
      "name = 'xfce4-notifyd'"
      "name *= 'VLC'"
      "name *= 'compton'"
      "window_type *= 'menu'"
    ];
    opacityRule = [
      "100:class_g *?= 'firefox'"
      "100:class_g *?= 'brave'"
      "100:name ~= 'Firefox$'"
      "100:name *= 'Chromium'"
      "100:name *= 'Chrome'"
      "100:name *= 'VLC'"
      "100:window_type *= 'menu'"
    ];
   }; 

}
