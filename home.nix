# Updated home.nix
{ inputs, pkgs, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.niri.homeModules.niri
    inputs.dms.homeModules.niri
  ];

  home.stateVersion = "25.11";
  
  home.packages = with pkgs; [
    firefox
    vim
    neovim
    fish
    kitty
    moonlight-qt
    btop
    htop
    stress-ng
    vscodium
    caligula
    iperf
  ]; 

  programs.starship.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Piyush";
        email = "piyush@example.com";
      };
    };
  };

}

