{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixpkgs-xr.nixosModules.nixpkgs-xr
    ../../modules/nixos
    ./hardware-configuration.nix
  ];

  networking.hostName = "daedalus";
  system.stateVersion = "25.05";

  home-manager.users.rintaro.imports = [
    ./home.nix
  ];
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  boot.kernelModules = [ "snd-virmidi" ];

  hardware.amdgpu.initrd.enable = true;
  hardware.enableAllFirmware = true;
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
  hardware.amdgpu.overdrive.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  programs.gamemode.enable = true;
  hardware.wooting.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };

  services.lact.enable = true;
  # services.wivrn.enable = true;
  # services.wivrn.openFirewall = true;
  # programs.weylus.enable = true;
  # programs.weylus.openFirewall = true;
  environment.systemPackages = with pkgs; [
    prismlauncher
    wootility
    # cisco-packet-tracer_9
    protonup-qt
    lutris
    # wayvr
    # xrizer
    # parsec-bin
    # davinci-resolve
    # blockbench

    # pipewire.jack
    # vmpk
    # alsa-utils
    # qsynth
    # fluidsynth
    # lmms
  ];
}
