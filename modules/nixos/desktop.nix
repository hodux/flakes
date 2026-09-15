{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.sysc-greet.nixosModules.default
  ];

  services.sysc-greet = {
    enable = true;
    compositor = "niri";  # or "hyprland" or "sway"
  };

  # authentication agent for gparted
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
    };
  };

  # waynergy systemd service
  # systemd.user.services.waynergy = {
  #   description = "waynergy-client";
  #   wantedBy = [ "graphical-session.target" ];
  #   serviceConfig = {
  #     ExecStart = "${pkgs.waynergy}/bin/waynergy -c 10.0.0.57 --enable-crypto --enable-tofu -b uinput";
  #     Restart = "on-failure";
  #     RestartSec = 5;
  #   };
  # };

  # Window Managers
  programs.niri = {
    enable = true;
  };

  security.polkit.enable = true;

  # Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts

    # Extra
    font-awesome
    nerd-fonts.jetbrains-mono
    inter
    corefonts
    vista-fonts
    meslo-lg
    nerd-fonts.meslo-lg
    nerd-fonts.geist-mono
  ];
}
