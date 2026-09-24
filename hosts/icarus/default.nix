{ pkgs, ... }:

{
  imports = [
    ../../modules/nixos
    ./hardware-configuration.nix
  ];

  networking.hostName = "icarus";
  system.stateVersion = "25.05";

  home-manager.users.rintaro.imports = [
    ./home.nix
  ];

  hardware = {
    graphics.extraPackages = with pkgs; [ intel-media-driver ];
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
          ControllerMode = "bredr";
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };

  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    # Keyd (Keyboard remapping)
    keyd.enable = true;
    keyd.keyboards.default.settings.main.capslock = "overload(control, esc)";
  };

  # Keyd Fix for Touchpad
  environment.etc."libinput/local-overrides.quirks".text = ''
    [Keyd Virtual Keyboard]
    MatchName=keyd virtual keyboard
    MatchUdevType=keyboard
    AttrKeyboardIntegration=internal
  '';

  environment.systemPackages = with pkgs; [
    webcamoid
  ];
}
