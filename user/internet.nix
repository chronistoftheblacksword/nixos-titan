{ config, pkgs, lib, outputs, ...}: 
{

  home.packages = with pkgs; [
  
  # Browsers
  brave

  # Cloud
  nextcloud-client

  ];


}
