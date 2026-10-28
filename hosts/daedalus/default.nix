{ pkgs, inputs, ... }:

{
  imports = [
    ../../modules/nixos
    ./hardware-configuration.nix
    # inputs.nixpkgs-xr.nixosModules.nixpkgs-xr
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
  hardware.enableAllFirmware = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  hardware.amdgpu = {
    initrd.enable = true;
    overdrive.enable = true;
  };
  hardware.graphics.extraPackages = with pkgs; [
    mesa.opencl
    rocmPackages.clr.icd
  ];

  powerManagement.cpuFreqGovernor = "performance";

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  services.ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
  services.lact.enable = true;
  # services.wivrn.enable = true;
  # services.wivrn.openFirewall = true;

  environment.systemPackages = with pkgs; [
    # blockbench
    davinci-resolve
    lutris
    prismlauncher
    protonup-qt
    # wayvr
    wine
    wootility
    # xrizer
  ];
}
