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

    [lockscreen_widgets]
    enabled = false
    schema_version = 2
    widget_order = [ "lockscreen-login-box@eDP-1" ]

        [lockscreen_widgets.grid]
        cell_size = 16
        major_interval = 4
        visible = true

        [lockscreen_widgets.widget."lockscreen-login-box@eDP-1"]
        box_height = 196.0
        box_width = 720.0
        cx = 960.0
        cy = 961.0
        output = "eDP-1"
        placement_height = 1080.0
        placement_width = 1920.0
        rotation = 0.0
        type = "login_box"

            [lockscreen_widgets.widget."lockscreen-login-box@eDP-1".settings]
            background_color = "surface_variant"
            background_opacity = 0.88
            background_radius = 12.0
            center_password_text = false
            input_opacity = 1.0
            input_radius = 6.0
            layout = "regular"
            show_caps_lock = true
            show_keyboard_layout = true
            show_login_button = true
            show_media = true
            show_session_buttons = true
            show_unlock_hint = true
            show_weather = true
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
