{ config, pkgs, ... }:

{

#  imports = [
#    ./programs
#  ];
   
  # TODO please change the username & home direcotry to your own
  home.username = "morgan";
  home.homeDirectory = "/home/morgan";

  programs.git = {
    enable  = true;
    userName  = "Leonardo Ammon";
    userEmail = "leonardo.a.ammon@gmail.com";
  };

  programs.vscode = { 
    enable = true; 
    userSettings = {
      "editor.fontLigatures" = true;
    };
  }; 
  
  programs.gh = { 
    enable = true;
    enableGitCredentialHelper = true;

  }; 
  home.packages = with pkgs; [ 
    discord

    #command line tools
    neofetch

    #utils
    ripgrep
    tree
    fzf 
    btop
    lsof
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
