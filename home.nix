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
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            { 
                name = "ms-dotnettools.csdevkit";
                publisher ="microsoft";
                version = "0.4.6";
                sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
              }
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
