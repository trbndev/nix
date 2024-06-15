{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
    };

    profiles.torben = {

      search.engines = {
        "Nix" = {
          urls = [{
            template = "https://mynixos.com/search";
            params = [
              { name = "q"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "n" ];
        };
      };
      search.force = true;

      bookmarks = [
        {
          name = "Toolbar";
          toolbar = true;
          bookmarks = [
            {
              name = "FMHY";
              tags = [ "fmhy" ];
              keyword = "fmhy";
              url = "https://fmhy.net/beginners-guide";
            }
          ];
        }
      ];

      settings = {
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
        "extensions.autoDisableScopes" = 0;
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        # General
        proton-pass

        # Privacy
        ublock-origin
        privacy-badger
 
        # Quality of Life
        sponsorblock
      ];
    };
  };
}
