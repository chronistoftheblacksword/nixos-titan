{ config, lib, pkgs, ... }: {
 
 services={
        xserver = {
            enable = true;

            windowManager.awesome = {
                enable = true;
                luaModules = with pkgs.luaPackages; [
                    luarocks # is the package manager for Lua modules
                    luadbi-mysql # Database abstraction layer
                    awesome-wm-widgets # Community collection of widgets
                ];

            };
        };

        displayManager = {
            sddm.enable = true;
            defaultSession = "none+awesome";
        };
    };
  environment.systemPackages = with pkgs; [
  
    rofi
    xrandr
    arandr
    #fish

  ];

}
