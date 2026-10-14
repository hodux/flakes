{ pkgs, ... }:

{
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # Languages & Package Managers
    bun
    cargo
    go
    gradle
    jdk21
    lua5_1
    luarocks
    maven
    nodejs_24
    pipx
    python3
    rustc

    # LSPs, Linters & Formatters
    ast-grep
    docker-language-server
    golangci-lint
    gopls
    jdt-language-server
    lua-language-server
    markdown-toc
    markdownlint-cli2
    marksman
    nixd
    nixfmt
    prettier
    pyright
    statix
    stylua
    tailwindcss-language-server
    taplo
    tree-sitter
    vscode-langservers-extracted
    vtsls
    yamllint

    # Compilers, Build Tools & Git
    act
    cmake
    gcc
    gh
    gnumake
    lazygit
    openssl
    packwiz

    # Editors & IDEs
    intellij-idea
    mousepad
    neovim
    vscode

    # Terminal, Shell & CLI Utilities
    direnv
    eza
    fd
    file
    fzf
    jq
    kitty
    ripgrep
    # sesh
    tldr
    tmux
    zoxide

    # Infrastructure, Cloud & Databases
    kubectl
    kubelogin-oidc
    kustomize
    opentofu
    talosctl
    vault-bin
    sqlite

    # AI & LLM Tools
    antigravity-cli
    opencode
    ollama

    # Networking & VPN
    curl
    dig
    networkmanager-openconnect
    proton-vpn
    smbclient-ng
    sshfs
    traceroute
    wget

    # Filesystems, Archives & Storage
    file-roller
    gparted
    p7zip
    mongosh
    unrar
    unzip

    # System, Hardware & Audio/Video Controls
    android-tools
    brightnessctl
    btop
    ddcutil
    libinput
    libqalculate
    lsof
    pavucontrol
    playerctl
    scrcpy

    # Wayland & Desktop Environment
    glib
    gnome-keyring
    gnome-themes-extra
    gsettings-desktop-schemas
    hyprpicker
    libnotify
    wl-clipboard
    wl-mirror
    wlopm
    xwayland-satellite

    # Virtualization & Compatibility
    wine

    # Media, Graphics & Document Processing
    ffmpeg
    ghostscript
    gimp
    hugo
    atril
    ristretto
    obs-studio
    obsidian
    onlyoffice-desktopeditors
    pureref
    tectonic
    vesktop
    celluloid

    # --- Eye Candy / Rice ---
    ansilove
    cmatrix
    fastfetch
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];
}
