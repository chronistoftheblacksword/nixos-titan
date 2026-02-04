{ config, pkgs, lib, outputs, ...}: 
{

  home.packages = with pkgs; [
    
    # Messenger Apps
    telegram-desktop
    signal-desktop
    altus
    beeper
    discord

    # Email
    thunderbird

  ];


}
