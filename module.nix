{ config, lib, pkgs, ... }:
with lib;
let
  xcfg = config.services.xserver;
  cfg = xcfg.desktopManager.cosmic;
in
{
  options = {
    services.xserver.desktopManager.cosmic.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable the COSMIC Epoch desktop manager";
    };
  };
  config = mkIf cfg.enable {
    #services.xserver.displayManager.sessionPackages = [ pkgs.cosmic-session ];

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-cosmic ];

    environment.systemPackages = with pkgs; [
      cosmic-applets
      cosmic-applibrary
      cosmic-bg
      cosmic-comp
      cosmic-launcher
      cosmic-osd
      cosmic-panel
      cosmic-settings
      cosmic-settings-daemon
    ];
  };
}
