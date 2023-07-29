{ 
  config,
  pkgs,
  home-manager,
  nix-vscode-extensions,
  ... 
}:

{
	programs.vscode = { 
	  enable = true; 
 	}
} 
