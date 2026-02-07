{ config, pkgs, lib, ...}: 
{
  home.packages = with pkgs; [ 
  
  xfce.thunar
  xfce.thunar-volman
  xfce.thunar-vcs-plugin
  xfce.thunar-archive-plugin
  xfce.thunar-media-tags-plugin

  kdePackages.dolphin
  
  rofi
  networkmanagerapplet
  blueman
  dunst
  pavucontrol
  volctl
  picom
  polkit
  polkit_gnome
  xss-lock
  i3lock-color
  sxhkd
  clipit
  flameshot
  udisks
  gvfs

  ];


}
