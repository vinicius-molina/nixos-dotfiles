{pkgs, ...}:

{
    home.packages = [
	  # system utils
	  pkgs.unzip
	  pkgs.wget
	  #pkgs.wpa_supplicant_gui
	  pkgs.htop
	  pkgs.clips # verify

	  # my system
	  pkgs.firefox
	  pkgs.ranger
	  pkgs.feh
	  pkgs.rofi
	  pkgs.ncmpcpp
	  pkgs.cmus
	  pkgs.mpv
	  pkgs.youtube-dl
	  pkgs.pandoc
	  pkgs.compton
	  pkgs.xwinwrap
	  pkgs.zsh
	  pkgs.oh-my-zsh
	  pkgs.libreoffice

	  # dev
	  #pkgs.vscode # unfree
	  pkgs.gcc
	  pkgs.linuxHeaders
	  pkgs.cmake
	  pkgs.gnumake
	  pkgs.elixir_1_8
	  pkgs.yarn
	  pkgs.python3
	  pkgs.python2
	  pkgs.nerdfonts
	  pkgs.python37Packages.powerline
	  pkgs.powerline-fonts
	  pkgs.fzf
	  pkgs.silver-searcher

	  # etc
	  #pkgs.krita
	  pkgs.chromium
	  pkgs.postgresql
	  pkgs.inotify-tools
	  pkgs.nodejs
	  pkgs.net_snmp

	  # games
	  #pkgs.steam # unfree
	  #pkgs.wine
    ];

    # CONFIGS
    
    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      userName = "vinicius-molina";
      userEmail = "vinicius_molina99@hotmail.com";
    };
    
    programs.bash = {
    	enable = true;
        shellOptions = ["checkjobs"];
        bashrcExtra = ''
            [[ -f ~/.aliases ]] && source ~/.aliases
        '';
    };
    
    programs.neovim = {
    	enable = true;
        viAlias = true; # o comando vi executa o nvim
        vimAlias = true; # o comando vim executa o nvim
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
