{ config, pkgs, ... }:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
  lock-empty-string = {
    Value = "";
    Status = "locked";
  };
in {
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
      DisablePocket = true;
      SearchBar = "unified";

      Preferences = {
        # Privacy settings
        "extensions.pocket.enabled" = lock-false;
        "browser.newtabpage.pinned" = lock-empty-string;
        "browser.topsites.contile.enabled" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
      };

      ExtensionSettings = with builtins;
        let extension = shortId: uuid: {
          name = uuid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
        in listToAttrs [
          # Essentials
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20")
          (extension "multi-account-containers" "@testpilot-containers")
          (extension "popupoff" "{154cddeb-4c8b-4627-a478-c7e5b427ffdf}")

          # Privacy
          (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
          (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
          (extension "canvasblocker" "CanvasBlocker@kkapsner.de")
          (extension "decentraleyes" "jid1-BoFifL9Vbdl2zQ@jetpack")
          (extension "dont-track-me-google1" "dont-track-me-google@robwu.nl")

          # Quality of Life
          (extension "minimaltwitter" "{e7476172-097c-4b77-b56e-f56a894adca9}")
          (extension "sponsorblock" "sponsorBlocker@ajay.app")
        ];
    };
  };
}