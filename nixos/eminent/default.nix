{ inputs, outputs, lib, config, pkgs, host, ... }:
{
  system.stateVersion = "23.05";
  modules = [
    clevis = ../../clevis;
    intel = ../../intel_graphics;
    pipewire = ../../pipewire;
    zram = ../../zram;
  ];
  imports = [
    ./hardware-configuration.nix
  ];
  networking.hostName = ${host};
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = true;
    };
  };
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

}