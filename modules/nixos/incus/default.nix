{ config, pkgs, ... }:
{
  virtualisation.incus = {
    enable = true;
  };
}