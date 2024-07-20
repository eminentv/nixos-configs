{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      # Apps
      "$mainMod, Return, exec, alacritty"
      "$mainMod, D, exec, yofi"
      # Tiling
      "$mainMod, P, pseudo"
      "$mainMod, S, togglesplit"
      "$mainMod, F, fullscreen"
      "$mainMod, Space, togglefloating"
      # Closing
      "SUPER SHIFT, Q, killactive"
      "SUPER SHIFT, E, exit"
      "CTRL ALT, L, exec, hyprlock"
      # PipeWire
      "XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      "XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      # Mic
      "XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
      "XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
      # Brightnessctl
      "XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      "XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      # Special Workspaces
      "$mainMod, C, togglespecialworkspace, magic"
      "$mainMod SHIFT, C, movetoworkspace, special:magic"
      # Toggle Groups
      "SUPER,g,togglegroup"
      "SUPER,tab,changegroupactive"
    ]
  };
}