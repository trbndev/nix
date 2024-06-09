{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      seatonjiang.gitmoji-vscode
    ];
    userSettings = {
      editor.cursorSmoothCaretAnimation = "on";
      editor.smoothScrolling = true;
      editor.cursorBlinking = "smooth";
    };
  };
}