{ pkgs, inputs, ... }:

{
  imports = [
    inputs.sysc-greet.nixosModules.default
  ];

  services.sysc-greet = {
    enable = true;
    compositor = "niri"; # or "hyprland" or "sway"
  };

  # authentication agent for gparted
  security.polkit.enable = true;
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
    };
  };

  # Window Managers
  programs.niri = {
    enable = true;
  };

  # Audio
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
