{ config, pkgs, nix-vscode-extensions, hyprland, ... }:


{
  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  programs = { 
    git = {
        enable  = true;
        userName  = "Leonardo Ammon";
        userEmail = "leonardo.a.ammon@gmail.com";
      };
    
    vscode = { 
        enable = true; 
        userSettings = {
          "editor.fontLigatures" = true;
          "workbench.colorTheme" = "Catppuccin Mocha";
          "editor.minimap.enabled" = false;
        };

        extensions = with pkgs.vscode-extensions; [
              catppuccin.catppuccin-vsc
              bbenoist.nix
              ms-dotnettools.csharp
              ms-vscode.cpptools
              ms-python.python
              angular.ng-template
     
      #   ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # {
      #   name = "csdevkit";
      #   publisher = "ms-dotnettools";
      #   version = "0.3.7";
      #   sha256 = "sha256-KqSu/6Pu+BC85Y3oiDDvEQChtQ6YdNTomaan9PBgEGo=";
      # }
      ]; 
       
      }; 

    gh = { 
        enable = true;
        enableGitCredentialHelper = true;
      }; 

  };

  home.packages = with pkgs; [ 
   #misc    
    vlc
    discord
    blender
    godot_4
    obsidian
   #command line tools
    neofetch
    #utils
    ripgrep   
    
    tree
    fzf 
    btop
    lsof    
    kitty
    nodejs
    nodePackages_latest.npm
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
