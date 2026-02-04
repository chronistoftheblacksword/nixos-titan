{ config, pkgs, lib, outputs, ...}: 
{

  home.packages = with pkgs; [

    bitwarden-desktop

  ];


}
