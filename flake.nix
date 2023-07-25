{
  description = "NixOS module for enabling the COSMIC Epoch desktop environment";
  inputs = {
    cosmic-applets.url = "github:pop-os/cosmic-applets";
    cosmic-applibrary.url = "github:pop-os/cosmic-applibrary";
    cosmic-bg.url = "github:pop-os/cosmic-bg";
    cosmic-comp.url = "github:pop-os/cosmic-comp";
    cosmic-launcher.url = "github:pop-os/cosmic-launcher";
    cosmic-osd.url = "github:pop-os/cosmic-osd";
    cosmic-panel.url = "github:pop-os/cosmic-panel";
    cosmic-session.url = "github:pop-os/cosmic-session";
    cosmic-settings.url = "github:pop-os/cosmic-settings";
    cosmic-settings-daemon.url = "github:pop-os/cosmic-settings-daemon";
    xdg-desktop-portal-cosmic.url = "github:pop-os/xdg-desktop-portal-cosmic";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self
    , cosmic-applets
    , cosmic-applibrary
    , cosmic-bg
    , cosmic-comp
    , cosmic-launcher
    , cosmic-osd
    , cosmic-panel
    , cosmic-session
    , cosmic-settings
    , cosmic-settings-daemon
    , xdg-desktop-portal-cosmic
    , nixpkgs
    }:

    {
      overlays.default = final: prev: {
        cosmic-applets = cosmic-applets.packages.default;
        cosmic-applibrary = cosmic-applibrary.packages.default;
        cosmic-bg = cosmic-bg.packages.default;
        cosmic-comp = cosmic-comp.packages.default;
        cosmic-launcher = cosmic-launcher.packages.default;
        cosmic-osd = cosmic-osd.packages.default;
        cosmic-panel = cosmic-panel.packages.default;
        cosmic-session = cosmic-session.packages.default;
        cosmic-settings = cosmic-settings.packages.default;
        cosmic-settings-daemon = cosmic-settings-daemon.packages.default;
        xdg-desktop-portal-cosmic = xdg-desktop-portal-cosmic.packages.default;
      };

      nixosModules.default = import ./module.nix {
        inherit (nixpkgs) config pkgs libs;
      };
    };
}
