{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Languages & Package Managers
    go
    bun
    nodejs_24
    gradle
    maven
    jdk21
    lua5_1
    luarocks
    python3

    # LSPs
    docker-language-server
    gopls
    jdt-language-server
    lua-language-server
    marksman
    nixd
    pyright
    tailwindcss-language-server
    taplo
    vscode-langservers-extracted
    vtsls
    
    # Linters
    golangci-lint
    markdownlint-cli2
    statix
    yamllint

    # Formatters
    nixfmt
    prettier
    stylua
    
    # Parsing
    ast-grep
    markdown-toc
    tree-sitter
    
    # Compilers & Build Tools
    cmake
    gcc
    gnumake
    hugo
    protobuf
    packwiz

    # Infrastructure, Cloud & Databases
    kubectl
    kubelogin-oidc
    kustomize
    opentofu
    talosctl
    vault-bin
  ];
}