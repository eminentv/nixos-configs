{ pkgs, config, ... }:
{
  programs.helix = {
    enable = true;
    # other config options
  };
  home.file.".config/helix" = {
    recursive = true;
    source = ./config;
  };
}
