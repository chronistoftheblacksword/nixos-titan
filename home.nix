{ config, pkgs, lib, ... }:

{
  imports = [

#    ./user/gaming.nix
     ./user/messenger.nix
     ./user/cli-tools.nix
     ./user/security.nix
     ./user/media.nix
     ./user/internet.nix
     ./user/media-creation.nix
#     ./user/awesomewm.nix
#     ./user/hyprland.nix

  ];



  # TODO please change the username & home directory to your own
  home.username = "basti";
  home.homeDirectory = "/home/basti";

  # Import files from the current configuration directory into the Nix store,
  # and create symbolic links pointing to those store files in the Home directory.

  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # Import the scripts directory into the Nix store,
  # and recursively generate symbolic links in the Home directory pointing to the files in the store.
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  #home.packages = with pkgs; [

  #];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Basti H.";
    userEmail = "seb.heinrich@outlook.com";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        #draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
      haupdate = "nix-channel --update";
      nixrebuild-titan = "sudo nixos-rebuild switch --flake ~/flakes/nixos#titan";
    };
  };


  #nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "steam" "steam-unwrapped" ];
  #programs.steam = {
  #  enable = true;
  #  gamescopeSession.enable = true; # For Steam Deck-like experience
  #  remotePlay.openFirewall = true;
  #  dedicatedServer.openFirewall = true;
  #  localNetworkGameTransfers.openFirewall = true;
  #  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

}
