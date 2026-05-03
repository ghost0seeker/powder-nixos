# Updated home.nix
{ inputs, pkgs, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    # inputs.niri.homeModules.niri
    # inputs.dms.homeModules.niri
  ];

  home.stateVersion = "25.11";
  
  home.packages = with pkgs; [
    firefox
    vim
    neovim
    fish
    # kitty
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
    python313Packages.kde-material-you-colors
    nerd-fonts.sauce-code-pro
    nerd-fonts.terminess-ttf
    caligula
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

# Create a proper KDE-compliant autostart entry
  home.file.".config/autostart/kde-material-you-colors.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=KDE Material You Colors
    Exec=kde-material-you-colors
    Icon=color-management
    Terminal=false
    X-KDE-autostart-after=panel
  '';

  # programs.niri.enable = true;

  #programs.kitty.enable = true; # required for the default Hyprland config

  programs.kitty = {
    enable = true;
    
    # The theme name matches what Nixpkgs provides
    theme = "Tokyo Night Moon";

    font = {
      name = "SauceCodePro Nerd Font Mono";
      size = 16.0;
    };

    settings = {
      # Font overrides
      bold_font = "auto";
      italic_font = "Terminess Nerd Font Mono";
      bold_italic_font = "Terminess Nerd Font Mono Bold";

      # Window Layout
      remember_window_size = "no";
      initial_window_width = "100c";
      initial_window_height = "30c";

      # Tab Bar
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

      # Animated Cursor (Kitty 0.30.0+)
      cursor_trail = 200;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 2;

      # Background
      background_opacity = "0.75";
      background_blur = 32;
    };
  };

  wayland.windowManager.hyprland.enable = false; # enable Hyprland

  programs.dank-material-shell = {
    enable  = false;
    #   niri = {
    #   enableSpawn = true;      # Auto-start DMS with niri, if enabled
    # };
    
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

