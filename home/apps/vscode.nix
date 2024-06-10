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
      editor.tabSize = 2;
      workbench.activityBar.location = "bottom";
      workbench.sideBar.location = "right";
      editor.minimap.enabled = false;
      window.titleBarStyle = "custom";
    };
  };
}