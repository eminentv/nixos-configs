{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    general = [
      "gap_in = 5"
      "gaps_out = 5"
      "border_size = 1"
      "col.active_border = rgba(1affffee)"
      "col.inactive_boarder = rgba(595959aa)"
      "no_border_no_floating = true"
      "layout = dwindle"
    ]
    animations = [
      "enabled = false"
    ]
    dwindle = [
      "pseudotile = true"
      "preserve_split = true"
      "no_gaps_when_only = false"
      "smart_split = true"
      "force_split = 2"
      "default_split_ratio = 1.2"
    ]
    decoration = [
      "rounding = 8"
      "active_opacity = 1.0"
    ]
  }
}