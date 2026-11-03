{ ... }:

{
  home.file.".config/noctalia/extra.toml".text = ''
    [control_center]
    hidden_tabs = [ "power" ]

    [bar]
    order = [ "default", "small" ]

        [bar.default]
        enabled = false
        margin_edge = 6

        [bar.small]
        end = [
            "tray",
            "notifications",
            "clipboard",
            "network",
            "bluetooth",
            "volume",
            "brightness",
            "battery",
            "control-center",
            "session"
        ]
        margin_edge = 4
        margin_ends = 525

            [bar.small.monitor.DELL]
            margin_ends = 900

    [osd]
    monitors = [ "DP-1" ]
  '';

  home.file.".config/niri/monitors.kdl".text = ''
    output "DP-1" {
      mode "3440x1440@143.975"
      scale 1
      transform "normal"
      position x=0 y=1080
    }

    output "DP-3" {
      mode "1920x1080@60"
      scale 1
      transform "normal"
      position x=760 y=0
    }
  '';
}
