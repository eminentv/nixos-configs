{ config, }:
{
  boot = {  
    initrd = {
      network.enable = true;
      clevis = {
        enable = true;
        useTang = true;
      };
    };
  };z
}