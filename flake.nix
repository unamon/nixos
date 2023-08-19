{
  description = "Morgan's NixOS flake";

  # Inputs
  # https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake.html#flake-inputs

  inputs =  { 
     nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
     home-manager = {
       url = "github:nix-community/home-manager/release-23.05";
       inputs.nixpkgs.follows = "nixpkgs";
     };

     #hyprland.url = "github:hyprwm/Hyprland";
     
     nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

     poetry2nix = { 
       url = "github:nix-community/poetry2nix";
       inputs.nixpkgs.follows = "nixpkgs";
     };

     node2nix = {
	      url = "github:svanderburg/node2nix";
        inputs.nixpkgs.follows = "nixpkgs";
     };
   };
  
  outputs = { self, nixpkgs, home-manager, ...}@inputs: {
  nixosConfigurations = { 
    "nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs.inputs = inputs; 
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	        home-manager.extraSpecialArgs = inputs; 
          home-manager.users.morgan = import ./home.nix;
        }
        
      ];
      };
    };
  };

}
	
