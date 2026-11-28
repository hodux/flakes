{ pkgs, inputs, ... }:

{
  imports = [
    ../../modules/nixos
    ./hardware-configuration.nix
  ];

  home-manager.users.rintaro.imports = [
    ./home.nix
  ];

  networking.hostName = "daedalus";
  system.stateVersion = "25.05";

  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    kernelModules = [ "snd-virmidi" ];
  };

  hardware.wooting.enable = true;
  hardware.steam-hardware.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  hardware.amdgpu = {
    initrd.enable = true;
    overdrive.enable = true;
  };
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];

  services.lact.enable = true;
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };
  # services.wivrn.enable = true;
  # services.wivrn.openFirewall = true;

  environment.systemPackages = with pkgs; [
    # blockbench
    davinci-resolve
    ds4u
    dualsensectl
    mangohud
    lutris
    prismlauncher
    wootility
    # wayvr
    # xrizer
  ];
}
