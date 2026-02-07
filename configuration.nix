# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

#let
#  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz;
#in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/nvidia.nix
      ./modules/git.nix
      ./modules/gaming.nix
#      (import "${home-manager}/nixos")
#      ./modules/hyprland.nix
      ./modules/awesomewm.nix
      ./modules/zsh.nix      
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "titan"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  #services.xserver.enable = true;
  services.xserver = {
  enable = true;
  #xrandrHeads = [
  #  {
  #    output = "DP-2";
  #    primary = true;
  #    monitorConfig = ''
  #      ModeLine "5120x1440_240" -hsync +vsync
  #      Option "PreferredMode" "5120x1440_240"
  #    '';
  #  }
  #  ];
  };
  services.xserver.displayManager.sessionCommands = ''
  ${pkgs.xorg.xrdb}/bin/xrdb -merge < ${pkgs.writeText "Xresources" ''
    Xcursor.theme: Adwaita
    Xcursor.size: 64
    Xft.dpi: 109
    Xft.antialias: true
    Xft.hinting: true
    Xft.hintstyle: hintslight
    Xft.rgba: rgb

    URxvt.depth: 32
    URxvt.geometry: 90x30
    URxvt.loginShell: true
    URxvt.internalBorder: 3
    URxvt.lineSpace: 0
    URxvt*shading: 15
    URxvt*saveLines: 12000
    URxvt*foreground: #dcdccc
    URxvt*background: #1c1c1c
    URxvt*font: xft:DejaVu Sans Mono:pixelsize=14
    URxvt*boldFont: xft:DejaVu Sans Mono:bold:pixelsize=14
    URxvt*scrollBar: true
    URxvt*scrollBar_right: true
    URxvt*scrollstyle: plain
 
    ! Define Solarized colors
    #define S_base03 #002b36
    #define S_base02 #073642
    #define S_base01 #586e75
    #define S_base00 #657b83
    #define S_base0  #839496
    #define S_base1  #93a1a1
    #define S_base2  #eee8d5
    #define S_base3  #fdf6e3
    #define S_red    #dc322f
    #define S_green  #859900
    #define S_yellow #b58900
    #define S_blue   #268bd2
    #define S_magenta #d33682
    #define S_cyan   #2aa198
    
    ! Apply to terminals
    *color0: S_base02
    *color8: S_base03
    *color1: S_red
    *color9: S_orange
    *color2: S_green
    *color10: S_base01
    *color3: S_yellow
    *color11: S_base00
    *color4: S_blue
    *color12: S_base0
    *color5: S_magenta
    *color13: S_violet
    *color6: S_cyan
    *color14: S_base1
    *color7: S_base2
    *color15: S_base3
  ''}
'';

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.basti = {
    #defaultUserShell = pkgs.zsh;
    isNormalUser = true;
    description = "basti";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [
    #  kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   neovim
   wget
   gparted
   xorg.xorgserver
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no"; #disable root login
    };
  };

  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  settings = {
    General = {
      # Shows battery charge of connected devices on supported
      # Bluetooth adapters. Defaults to 'false'.
      Experimental = true;
      # When enabled other devices can connect faster to us, however
      # the tradeoff is increased power consumption. Defaults to
      # 'false'.
      FastConnectable = true;
    };
    Policy = {
      # Enable all controllers when they are found. This includes
      # adapters present on start as well as adapters that are plugged
      # in later on. Defaults to 'true'.
      AutoEnable = true;
    };
  };
};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

  # Experimental Features (flakes)
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Home Manager
  #home-manager.users.basti = { pkgs, ... }: {
  #  home.packages = [ pkgs.atool pkgs.httpie ];
  #  programs.bash.enable = true;

  #  home.stateVersion = "25.11";
  #};



}
