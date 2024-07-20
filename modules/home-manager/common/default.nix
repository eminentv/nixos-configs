{
  pkgs,
  inputs,
  ...
}: 

{
  services.bpftune.enable = true;
  imports = [
    ./environment.nix
    ./atuin.nix
    ./bat
    ./btop
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./helix
    ./git.nix
    ./ripgrep.nix
    ./tmux
    ./zoxide.nix
    ./nushell.nix
    ./zsh.nix
  ];

  home.shellAliases = {
    rm = "rm -i";
    grep = "rg";
    du = "dust";

  }
  home.packages = with pkgs; [
    nix-tree
    jc
    jq
    libnotify
    libxcrypt
    tealdeer
    sniffnet
    trippy
    procs
    bpftop
    cvslens
    hexyl
    ouch
    repgrep
    dconf
    fd
    dust
  ];
}
