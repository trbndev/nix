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
      # Editor Settings
      editor.cursorSmoothCaretAnimation = "on";
      editor.smoothScrolling = true;
      editor.cursorBlinking = "smooth";
      editor.tabSize = 2;
      editor.minimap.enabled = false;
      
      # Workbench Settings
      workbench.activityBar.location = "bottom";
      workbench.sideBar.location = "right";
      workbench.layoutControl.enabled = false;

      # Window Settings
      window.titleBarStyle = "custom";
      window.commandCenter = false;

      # Git Settings
      git.confirmSync = false;
    };
  };
}