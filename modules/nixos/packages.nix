{ pkgs, ... }:

{
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # Editors & IDEs
    neovim
    vscode

    # Terminal, Shell & CLI Utilities
    act
    cloudflared
    eza
    fastfetch
    fd
    file
    fzf
    gh
    gperftools
    jq
    jujutsu
    kitty
    lazygit
    openssl
    pciutils
    ripgrep
    tldr
    tmux
    yazi
    zoxide

    # AI & LLM Tools
    antigravity-cli
    claude-code
    t3code
    antigravity-acp

    # Networking
    curl
    dig
    smbclient-ng
    sshfs
    traceroute
    wget

    # Wayland, System & Hardware
    brightnessctl
    btop
    ddcutil
    dust
    libnotify
    libqalculate
    lsof
    networkmanagerapplet
    p7zip
    playerctl
    unrar
    unzip
    wlopm
    xwayland-satellite
    wl-clipboard

    # Desktop Environment
    baobab
    dbeaver-bin
    file-roller
    gimp
    gnome-text-editor
    gparted
    hyprpicker
    inkscape
    loupe
    mission-center
    nautilus
    obsidian
    onlyoffice-desktopeditors
    papers
    # pureref
    rnote
    showtime
    snapshot
    # tracy
    vesktop
    wl-mirror

    # Processing
    ffmpeg
    ghostscript
    imagemagick
    pandoc
    shellcheck
    tectonic
    xvfb-run

  ];
}
