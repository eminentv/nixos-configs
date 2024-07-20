{ config, pkgs, disko, ... }:
{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot"
                mountOptions = [
                  "noatime"
                ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "cryptroot";
                settings = {
                  keyFile = config.sops.secrets.init.eminent_boot
                  extraFormatArgs = [
                    "--cipher" "aes-xts-plain64"
                    "--key-size" "512"
                    "--pbkdf" "argon2id"
                    "--iter-time" "4000"
                    "--pbkdf-memory" "1048576"
                    "--pbkdf-parallel" "8"
                  ];
                };
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes ={
                    "sub-root" = { };
                    "sub-nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "sub-log" = {
                      mountpoint = "/var/log";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "sub-persist" = {
                      mountpoint = "/persist";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "sub-persist/root" = { };
                    "sub-persist/home" = { };
                    "sub-swap" = {
                      mountpoint = "/.swapvol";
                      swap.swapfile.size = "5G";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}