{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    profiles.torben = {
      bookmarks = [
        {
          name = "wikipedia";
          tags = [ "wiki" ];
          keyword = "wiki";
          url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        }
      ]
    };
  };
}