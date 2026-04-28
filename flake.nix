{
  description = "System Flake";

  inputs = {
    # This is where you lock your NixOS version
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11"; 

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    niri = {
      url = "github:sodiboo/niri-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  # The 'inputs' argument in outputs needs to be explicitly defined or used via @
  outputs = { self, nixpkgs, home-manager, dms, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # Semicolon was missing here
      specialArgs = { inherit inputs; }; 
      
      modules = [
        # Import your existing configuration.nix
        ./configuration.nix
        
        # Add home-manager as a module
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # Fixed typo: 'importr' to 'import'
          home-manager.users.powder = import ./home.nix;
          # Added missing semicolon
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
