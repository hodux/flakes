{
  config,
  pkgs,
  inputs,
  ...
}:

# Networking
{
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      plugins = [ pkgs.networkmanager-openconnect ];
    };
    # wg-quick.interfaces = {
    #   user07 = {
    #     configFile = "/etc/wireguard/user07.conf";
    #   };
    # };
  };

  time.timeZone = "America/Toronto";
  services = {
    udisks2 = {
      enable = true;
      # Optional: if you want it to show up specifically in /media instead of /run/media
      mountOnMedia = true;
    };
    # For thunar
    gvfs.enable = true;
    envfs.enable = true;
    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
    resolved = {
      enable = true;
      fallbackDns = [
        "1.1.1.1"
        "9.9.9.9"
      ];
    };

  };

  # User Account
  users.users.rintaro = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "libvirtd"
      "kvm"
      "uinput"
      "input"
      "wireshark"
      "i2c"
      "adbusers"
      "networkmanager"
    ];
    shell = pkgs.fish;
  };

  # Nix Settings (Flakes, Garbage Collection, etc)
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    download-buffer-size = 524288000;
    auto-optimise-store = true;
    substituters = [
      "https://cache.nixos.org"
      "https://attic.xuyh0120.win/lantian"
      "https://cache.xinux.uz"
      "https://noctalia.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  # Automatic GC a week
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nixpkgs.config.allowUnfree = true;

  # Core Programs
  programs = {
    fish.enable = true;
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
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

  # To avoid fish long rebuild times
  documentation.man.cache.enable = false;

  # Swap
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 4 * 1024;
    }
  ];
  zramSwap.enable = true;

}
