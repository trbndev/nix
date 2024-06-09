{ ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    # profiles.torben = {};
  };
}