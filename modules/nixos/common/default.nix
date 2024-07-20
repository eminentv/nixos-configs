# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  hardening = import ./hardening.nix;
  nix_config = import ./nix.nix;
  boot = import ./boot.nix;
  fonts = import ./fonts.nix;
  locale = import ./locale.nix;
  network = import ./networking.nix;
  noexec = import ./noexec.nix;
  extrapkgs = import ./pkgs.nix;
}
