{config, pkgs, ...}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  nixpkgs.config.allowUnfree = true;

  # 32 bit openGL support, for steam works
  hardware.opengl.driSupport32Bit = true;

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
    feh # image view with recursive to wallpapers
    sxiv # image view with gif support
    rofi
    cmus
    mpv
    youtube-dl # download yt
    compton # composite xorg
    xwinwrap # to add animated wallpapers
    zsh
    oh-my-zsh
    libreoffice
    #gnome3.nautilus # file mannager
    dolphin # file mannager
    ranger # console file mannager
    lxappearance # mannage themes
    mpd # server music
    ncmpcpp # client music
    (polybar.override {
      alsaSupport = true;
      pulseSupport = true;
      mpdSupport = true;
      i3Support = true;
    })
    
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
    python37Packages.powerline
    fzf
    silver-searcher

    # fonts
    nerdfonts
    powerline-fonts
    
    # etc
    krita
    postgresql
    inotify-tools
    arandr # organize monitors
    
    # games
    steam # unfree
    #wine
  ];

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  
  # environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivation to /run/current-system/sw
  services.xserver = {
    enable = true;
    videoDrivers = [
      "nvidia"
    ];

    # to see all layouts/variant/options use:
    # cat `(nix-build --no-out-link '<nixpkgs>' -A xorg.xkeyboardconfig)`/etc/X11/xkb/rules/base.lst
    # to see locales: https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/SUPPORTED

    layout = "us";
    xkbVariant = "intl";
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
	  i3lock-fancy
	];
      };
  };
  
  services.mpd = {
    enable = true;
    startWhenNeeded = true;
    musicDirectory = /home/vinicius/music;
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
    opacityRules = [
      "100:class_g *?= 'firefox'"
      "100:class_g *?= 'brave'"
      "100:name ~= 'Firefox$'"
      "100:name *= 'Chromium'"
      "100:name *= 'Chrome'"
      "100:name *= 'VLC'"
      "100:window_type *= 'menu'"
    ];
  }; 

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh.enable = true;
    ohMyZsh.theme = "agnoster";
  };

}
