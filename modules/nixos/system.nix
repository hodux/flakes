{ pkgs, ... }:

{
  time.timeZone = "America/Toronto";

  # Nix
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    download-buffer-size = 524288000;
  };

  # this avoids slow rebuilds from fish generating man caches
  documentation.man.cache.enable = false;

  # Users
  users.users.rintaro = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "libvirtd"
      "kvm"
      "uinput"
      "input"
      "wireshark"
      "i2c"
      "adbusers"
    ];
  };

  # Networking
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "8.8.8.8"
    "8.8.4.4"
  ];

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    plugins = [ pkgs.networkmanager-openconnect ];
  };

  services.resolved.enable = true;

  # Services
  services.gnome.gnome-keyring.enable = true;
  services.envfs.enable = true;
  services.ollama.enable = true;

  services.udisks2 = {
    enable = true;
    mountOnMedia = true;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint ];
  };

  # Virtualisation
  programs.virt-manager.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Development
  programs.fish.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.git = {
    enable = true;
    config.init.defaultBranch = "main";
  };
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      stdenv.cc
      zlib
      fuse3
      icu
      nss
      openssl
      curl
      expat
    ];
  };

  # Swap
  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 4 * 1024;
    }
  ];
}