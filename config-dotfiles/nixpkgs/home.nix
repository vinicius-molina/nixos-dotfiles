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

	  # etc
	  #pkgs.krita

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
        profileExtra = ''
            [[ -f ~/.aliases ]] && source ~/.aliases
        '';
    };
    
    programs.neovim = {
    	enable = true;
        viAlias = true; # o comando vi executa o nvim
        vimAlias = true; # o comando vim executa o nvim
    };

}
