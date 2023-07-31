{ config, pkgs, nix-vscode-extensions, ... }:


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
        };
        extensions = with pkgs.vscode-extensions; [
              catppuccin.catppuccin-vsc
              ms-dotnettools.csharp
              bbenoist.nix
        ];
      }; 

    gh = { 
        enable = true;
        enableGitCredentialHelper = true;
      }; 

#    kitty = { 
#	enable = true; 
#    };
  };

  home.packages = with pkgs; [ 
   #misc    
    vlc
    discord
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
