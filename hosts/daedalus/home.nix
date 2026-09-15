{ config, ... }:

{
  home.file.".config/noctalia/extra.toml".text = ''
    [control_center]
    hidden_tabs = [ "power" ]

    [bar.default]
    enabled = false
    margin_edge = 6

    [bar]

        [bar.small]

            [bar.small.monitor.dell]
            margin_ends = 900

    [lockscreen_widgets]
    schema_version = 2
    widget_order = [ "lockscreen-login-box@dp-3", "lockscreen-login-box@dp-1" ]

    [lockscreen_widgets.grid]
    cell_size = 16
    major_interval = 4
    visible = true

    [lockscreen_widgets.widget."lockscreen-login-box@dp-1"]
    box_height = 196.0
    box_width = 720.0
    cx = 1720.0
    cy = 1321.0
    output = "dp-1"
    placement_height = 1440.0
    placement_width = 3440.0
    rotation = 0.0
    type = "login_box"

        [lockscreen_widgets.widget."lockscreen-login-box@dp-1".settings]
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

    [lockscreen_widgets.widget."lockscreen-login-box@dp-3"]
    box_height = 196.0
    box_width = 720.0
    cx = 960.0
    cy = 961.0
    output = "dp-3"
    placement_height = 1080.0
    placement_width = 1920.0
    rotation = 0.0
    type = "login_box"

        [lockscreen_widgets.widget."lockscreen-login-box@dp-3".settings]
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
