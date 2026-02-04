{ config, pkgs, lib, outputs, ...}: 
{

  home.packages = with pkgs; [

    scarlett2
    shotcut
    gimp2-with-plugins
    guitarix
 
  ];


}
