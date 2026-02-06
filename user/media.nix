{ config, pkgs, lib, outputs, ...}: 
{

  home.packages = with pkgs; [

  vlc
  qimgv
  flameshot
  spotify
  mpd
  ncmpc

  ];


}
