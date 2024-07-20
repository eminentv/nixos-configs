{ inputs, outputs, lib, config, pkgs, home-manager, host, ... }:
{
  users.users = {
    eminent ={
      initialPassword = ;
      isNormalUser = true;
      shell = pkgs.zsh;
      hashedPasswordFile = config.sops.secrets.init.eminent_user;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINnERs+v8l876sgmLLECx4Ar3W6cbofGpExHbr4ysPMu jakeniederer@theartofmalware.com"
      ];
      extraGroups = ["wheel" "networkmanager" "audio" ];
    };
  };
  modules = [];
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      eminent = import ../../home-manager/eminent;
    };
  };
}