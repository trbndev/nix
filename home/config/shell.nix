{ environment, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    # initExtra = "eval \"$(oh-my-posh init zsh)\"";
  };
  # programs.oh-my-posh = {
  #  enable = true;
  #  enableZshIntegration = true;
  # };
}