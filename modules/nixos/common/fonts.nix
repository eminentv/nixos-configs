{ pkgs, config, ... }:
{
  fonts ={
    fontDir.enable = true;
    packages = with pkgs; [
      terminus-nerdfont
      fira-code-nerdfont
    ];
  };
}