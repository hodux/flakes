{ pkgs, inputs, ... }:

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
  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    kernelModules = [ "snd-virmidi" ];
  };

  hardware = {
    amdgpu.initrd.enable = true;
    enableAllFirmware = true;
    graphics.extraPackages = with pkgs; [
      mesa.opencl
      rocmPackages.clr.icd
    ];
    amdgpu.overdrive.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    wooting.enable = true;
  };

  programs.gamemode.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  services = {
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    lact.enable = true;
    # wivrn.enable = true;
    # wivrn.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    # wayvr
    # xrizer
    prismlauncher
    wootility
    protonup-qt
    lutris
    # parsec-bin
    davinci-resolve
    # blockbench
  ];
}
