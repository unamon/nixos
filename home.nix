{ config, pkgs, ... }:

{
  # TODO please change the username & home direcotry to your own
  home.username = "morgan";
  home.homeDirectory = "/home/morgan";

  programs.git = {
    enable  = true;
    userName  = "Leonardo Ammon";
    userEmail = "leonardo.a.ammon@gmail.com";
  };

  home.packages = with pkgs; [ 
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
