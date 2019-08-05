{pkgs, ...}:

{
	home.packages = [
	  # system utils
	  pkgs.unzip
	  pkgs.wget
	  pkgs.wpa_supplicant_gui
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
	  pkgs.elixir_1_8
	  pkgs.yarn

	  # etc
	  #pkgs.krita

	  # games
	  #pkgs.steam # unfree
	  #pkgs.wine

	  # nootbook
	  pkgs.bluez # blutooth suport
	  pkgs.blueman # GTK blutooth manager
	  pkgs.xorg.xf86inputsynaptics # touchpad support

	  # printer
	  pkgs.cups
	];

	# CONFIGS

    	programs.git = {
	 enable = true;
	 userName = "vinicius-molina";
	 userEmail = "vinicius_molina99@hotmail.com";
	};
	
}
