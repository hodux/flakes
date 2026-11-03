{ ... }:

{
  home.file.".config/noctalia/extra.toml".text = ''
    [bar.default]
    concave_edge_corners = false
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
    margin_ends = 400

    [brightness]
    minimum_brightness = 0.0099999997764825821

  '';

  home.file.".config/niri/monitors.kdl".text = ''
    output "eDP-1" {
      mode "1920x1080@60"
      scale 1
      transform "normal"
      position x=0 y=1080
    }

    output "DP-1" {
      mode "1920x1080@60"
      scale 1
      transform "normal"
      position x=330 y=0
      // position x=1920 y=0
    }
  '';
}
