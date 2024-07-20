{ config, ... }:
{
  sops.secrets = {
    init = {
      file = ./secrets/boot.yaml;
    };
  };
}
