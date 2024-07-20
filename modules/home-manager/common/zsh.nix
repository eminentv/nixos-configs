{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    history = {
      extended = true;
      ignoreAllDups = true;
    };
    profileExtra = [
      "[ "$(tty)" = "/dev/tty2" ] && exec sway";
      "[ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session Hyprland";
    ];
    sessionVariables = [
      EDITOR = "hx";
      TERM = "xterm-256color";
      USE_EDITOR = "$EDITOR";
      VISUAL = "$EDITOR";
      LANG = en_US_UTF-8;
      LANGUAGE = en;
      TZ = US/Eastern;
    ];
    enableVteIntegration = true;
    shellAliases = { 
      myip = "curl http://ipecho.net/plain; echo";
      rm = "rm -i";
      vim = "hx";
      grep = "rg";
      cat = "bat";
      htop = "btop";
      du = "dust";
    };
    # shellGlobalAliases = { };
    antidote = {
      enable = true;
      plugins = [
        "ohmyzsh/ohmyzsh path:lib/git.zsh"
        "ohmyzsh/ohmyzsh path:lib/clipboard.zsh"
        "ohmyzsh/ohmyzsh path:plugins/aliases"
        "ohmyzsh/ohmyzsh path:plugins/copypath"
        "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
        "ohmyzsh/ohmyzsh path:plugins/extract"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/git-extras"
        "ohmyzsh/ohmyzsh path:plugins/magic-enter"
        "ohmyzsh/ohmyzsh path:plugins/npm"
        "ohmyzsh/ohmyzsh path:plugins/pyenv"
        "ohmyzsh/ohmyzsh path:plugins/python"
        "ohmyzsh/ohmyzsh path:plugins/tmux"
        "djui/alias-tips"
        "dim-an/cod"
        "wfxr/forgit"
        "MichaelAquilina/zsh-autoswitch-virtualenv"
        "chisui/zsh-nix-shell"
        "nix-community/nix-zsh-completions"
        "romkatv/powerlevel10k"
      ];
    };
  };
}