{ config, ... }:
{
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.sessionVariables = {
    EDITOR = "hx";
    TERM = "xterm-256color";
    USE_EDITOR = "$EDITOR";
    VISUAL = "$EDITOR";
    sed = "sd"
    
  };
}