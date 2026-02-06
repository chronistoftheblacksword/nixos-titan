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

  ];


}
