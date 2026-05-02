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
    syncthing
    obsidian
    chromium
    steam
    protontricks
    protonplus
    protonup-qt
    gearlever
    python314
    appimage-run
  ]; 

  programs.starship.enable = true;
  
  services.ssh-agent.enable = true;
  
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Piyush";
        email = "piyush@example.com";
      };
    };
  };

  programs.niri.enable = true;

  programs.dank-material-shell = {
    enable  = true;
      niri = {
      enableSpawn = true;      # Auto-start DMS with niri, if enabled
    };
    
    settings = {
      theme = "dark";
      dynamicTheming = true;
      # Add any other settings here
    };

    clipboardSettings = {
      maxHistory = 25;
      maxEntrySize = 5242880;
      autoClearDays = 1;
      clearAtStartup = true;
      disabled = false;
      disableHistory = false;
      disablePersist = true;
    };

    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting items from the clipboard (wtype)

  };

}

