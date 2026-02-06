{ config, pkgs, lib, ...}: 
{

  programs.hyprland.enable = true; # enable Hyprland

  environment.systemPackages = [
    # ... other packages
    pkgs.kitty # required for the default Hyprland config
    pkgs.wofi
    pkgs.waybar
    pkgs.pavucontrol
    pkgs.blueman
    pkgs.bluez


  ];

  # Optional, hint Electron apps to use Wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

}
