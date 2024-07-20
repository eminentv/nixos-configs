{
  config,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = false;
    systemd.enable = true;
    systemd.enableXdgAutostart = true;
    package = pkgs.hyprland;
    importantPrefixes = [];
    extraConfig = ''

    '';
    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
      pkgs.hyprlandPlugins.hyprbars
    ];
    systemd.variables = [];
  };
  security.pam.services = {
    hyprlock = true;
    swaylock = {
      text = ''
        auth include login
      '';
    };
  };
  services = {
    swayosd = {
      enable = true;
    };
    hypridle = {
      settings = {};
      enable = true;
    };
    hyprpaper = {
      settings = {};
      enable = true;
    };
  };
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl disoatch dpms on";
        ignore_dbus_inhibit = flase;
        lock_cmd = "hyprlock";
      };
      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
  programs.zsh = {
    profileExtra = [
      "[ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session Hyprland"
    ];
  };
  #programs.hyprlock.enable = true;
  #security.pam.services.hyprlock = true;
  #services.hypridle.enable = true;

#  home.file.".config/hypr" = {
#     recursive = true;
#     source = ./hypr;
#   };
}