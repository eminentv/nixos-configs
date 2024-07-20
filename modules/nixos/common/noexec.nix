{ ... };

{
  filesystems."/".options = [ "noexec" ];
  filesystems."/etc/nixos".options = [ "noexec" ];
  filesystems."/srv".options = [ "noexec" ];
  filesystems."/var/log".options = [ "noexec" ];
}