{
  description = "NixOS module for enabling the COSMIC Epoch desktop environment";
  inputs = {
    cosmic-applibrary.url = "github:pop-os/cosmic-applibrary";
    cosmic-bg.url = "github:pop-os/cosmic-bg";
    # im too lazy to nix-ify the design repo
    #cosmic-design-demo.url = "github:pop-os/cosmic-design-demo";
    cosmic-launcher.url = "github:pop-os/cosmic-launcher";
    cosmic-notifications.url = "github:pop-os/cosmic-notifications";
    # and this one
    #cosmic-screenshot.url = "github:pop-os/cosmic-screenshot";
    cosmic-session.url = "github:pop-os/cosmic-session";
    cosmic-settings-daemon.url = "github:pop-os/cosmic-settings-daemon";
    xdg-desktop-portal-cosmic.url = "github:pop-os/xdg-desktop-portal-cosmic";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self
    , cosmic-applibrary
    , cosmic-bg
    #, cosmic-design-demo
    , cosmic-launcher
    , cosmic-notifications
    #, cosmic-screenshot
    , cosmic-session
    , cosmic-settings-daemon
    , xdg-desktop-portal-cosmic
    , nixpkgs
    }:

    {
      overlays.default = final: prev: {
        cosmic-applibrary = cosmic-applibrary.packages.default;
        cosmic-bg = cosmic-bg.packages.default;
        #cosmic-design-demo = cosmic-design-demo.packages.default;
        cosmic-launcher = cosmic-launcher.packages.default;
        cosmic-notifications = cosmic-notifications.packages.default;
        #cosmic-screenshot = cosmic-screenshot.packages.default;
        cosmic-session = cosmic-session.packages.default;
        cosmic-settings-daemon = cosmic-settings-daemon.packages.default;
        xdg-desktop-portal-cosmic = xdg-desktop-portal-cosmic.packages.default;
      };

      nixosModules.default = import ./module.nix {
        inherit (nixpkgs) config pkgs lib;
      };
    };
}
