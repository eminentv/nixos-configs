{ config, lib, pkgs, ... }:
{
  # scudo memory allocato
  environment = {
    memoryAllocator.provider = "scudo";
    variables.SCUDO_OPTIONS = "ZeroContents=1";
    defaultPackages = lib.mkForce [];
  };
  # kernel hardening
  security = {
    lockKernelModules = true;
    protectKernelImage = true;
    forcePageTableIsolation = true;
    sudo.enable = false;
    doas ={
      enable = true;
      extraRules = [{
        keepEnv = true;
      }];
    }
  };
  # boot kernel parameters
  boot.kernelParams = [
    # Don't merge slabs
    "slab_nomerge"

    # Overwrite free'd pages
    "page_poison=1"

    # Enable page allocator randomization
    "page_alloc.shuffle=1"

    # Disable debugfs
    "debugfs=off"

    # Enable mitigations
    "mitigations=auto,nosmt"

    # Better entropy, may lead to longer boot time
    "random.trust_cpu=off"
    "random.trust_bootloader=off"
  ];
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.log_martians" = true;
    "net.ipv4.conf.all.rp_filter" = "1";
    "net.ipv4.conf.default.log_martians" = true;
    "net.ipv4.conf.default.rp_filter" = "1";
    "net.ipv4.icmp_echo_ignore_broadcasts" = true;
    "net.ipv4.conf.all.accept_redirects" = false;
    "net.ipv4.conf.default.secure_redirects" = false;
    "net.ipv6.conf.all.accept_redirects" = false;
    "net.ipv6.conf.default.accept_redirects" = false;
    "net.ipv4.conf.all.send_redirects" = false;
    "net.ipv4.conf.default.send_redirects" = false;
  };

  systemd.coredump.enable = false;
}