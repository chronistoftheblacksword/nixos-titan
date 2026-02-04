{ config, pkgs, lib, outputs, ...}: 
{

  home.packages = with pkgs; [
 
    telegram-desktop
    signal-desktop
    altus
    beeper
    discord

  ];


}
