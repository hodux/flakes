{ ... }:

{
  hardware = {
    uinput.enable = true;
    i2c.enable = true;
    # Graphics
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # Firmware & Power
  services.fwupd.enable = true;
}
