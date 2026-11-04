{ pkgs, ... }:

{
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # Editors & IDEs
    intellij-idea
    mousepad
    neovim
    vscode

    # Terminal, Shell & CLI Utilities
    act
    eza
    fastfetch
    fd
    file
    fzf
    gh
    jq
    jujutsu
    kitty
    lazygit
    openssl
    ripgrep
    tldr
    tmux
    zoxide

    # AI & LLM Tools
    antigravity-cli
    claude-code

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

    # Desktop Environment
    atril
    dbeaver-bin
    file-roller
    gimp
    gparted
    hyprpicker
    mission-center
    mpv
    obsidian
    onlyoffice-desktopeditors
    pureref
    ristretto
    rnote
    tracy
    vesktop
    webcamoid
    wl-clipboard
    wl-mirror

    # Processing
    ffmpeg
    ghostscript
    imagemagick
    ink

  ];
}
