{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.torben = {
      search = {
        force = true;
        engines = {
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

          "Bing".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
          "Google".metaData.alias = "g";
          "DuckDuckGo".metaData.alias = "d";
        };
        default = "DuckDuckGo";
      };

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
    };
  };
}
