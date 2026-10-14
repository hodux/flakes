{
  config,
  pkgs,
  inputs,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/projects/flakes/dotfiles";
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
    inputs.zen-browser.homeModules.beta
    inputs.noctalia.homeModules.default
    ./theme.nix
  ];

  home = {
    username = "rintaro";
    homeDirectory = "/home/rintaro";
    # dotfiles
    file = {
      ".config/Code/User/settings.json".source =
        config.lib.file.mkOutOfStoreSymlink "${dotfiles}/code/settings.json";
      ".config/Code/User/keybindings.json".source =
        config.lib.file.mkOutOfStoreSymlink "${dotfiles}/code/keybindings.json";
      ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/fish";
      ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/kitty";
      ".config/niri/config.kdl".source =
        config.lib.file.mkOutOfStoreSymlink "${dotfiles}/niri/config.kdl";
      ".config/noctalia/noctalia-config.toml".source =
        config.lib.file.mkOutOfStoreSymlink "${dotfiles}/noctalia/noctalia-config.toml";
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
      ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux";
      ".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/idea/.ideavimrc";
    };
  };

  programs = {
    noctalia.enable = true;
    zen-browser.enable = true;
    spicetify = {
      enable = true;
      wayland = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      # theme = spicePkgs.themes.catppuccin;
      # colorScheme = "mocha";
    };
  };

  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "zen-beta.desktop";
        "x-scheme-handler/http" = "zen-beta.desktop";
        "x-scheme-handler/https" = "zen-beta.desktop";
        "x-scheme-handler/about" = "zen-beta.desktop";
        "x-scheme-handler/unknown" = "zen-beta.desktop";
        "application/xhtml+xml" = "zen-beta.desktop";

        "image/jpeg" = "org.xfce.ristretto.desktop";
        "image/png" = "org.xfce.ristretto.desktop";
        "image/gif" = "org.xfce.ristretto.desktop";
        "image/webp" = "org.xfce.ristretto.desktop";
        "image/svg+xml" = "org.xfce.ristretto.desktop";
        "image/bmp" = "org.xfce.ristretto.desktop";
        "image/tiff" = "org.xfce.ristretto.desktop";

        "application/pdf" = "atril.desktop";
        "application/epub+zip" = "atril.desktop";
        "application/postscript" = "atril.desktop";

        "inode/directory" = "thunar.desktop";

        "text/plain" = "org.xfce.mousepad.desktop";
        "text/markdown" = "org.xfce.mousepad.desktop";
        "application/json" = "org.xfce.mousepad.desktop";
        "application/x-shellscript" = "org.xfce.mousepad.desktop";
        "text/x-c" = "org.xfce.mousepad.desktop";
        "text/x-c++" = "org.xfce.mousepad.desktop";
        "text/x-python" = "org.xfce.mousepad.desktop";
        "text/rust" = "org.xfce.mousepad.desktop";
        "text/xml" = "org.xfce.mousepad.desktop";
        "application/xml" = "org.xfce.mousepad.desktop";

        "video/mp4" = "io.github.celluloid_player.Celluloid.desktop";
        "video/x-matroska" = "vio.github.celluloid_player.Celluloid.desktop";
        "video/webm" = "vio.github.celluloid_player.Celluloid.desktop";
        "audio/mpeg" = "vio.github.celluloid_player.Celluloid.desktop";
        "audio/flac" = "vio.github.celluloid_player.Celluloid.desktop";
        "audio/x-wav" = "vio.github.celluloid_player.Celluloid.desktop";

        "application/zip" = "org.gnome.FileRoller.desktop";
        "application/x-tar" = "org.gnome.FileRoller.desktop";
        "application/x-bzip2" = "org.gnome.FileRoller.desktop";
        "application/x-gzip" = "org.gnome.FileRoller.desktop";
        "application/x-xz" = "org.gnome.FileRoller.desktop";
        "application/x-7z-compressed" = "org.gnome.FileRoller.desktop";
        "application/vnd.rar" = "org.gnome.FileRoller.desktop";
      };
    };
    desktopEntries = {
      trash = {
        name = "Trash";
        genericName = "Trash Can";
        comment = "Open the Trash Can";
        exec = "thunar trash:///";
        icon = "user-trash";
        terminal = false;
        categories = [
          "System"
          "Utility"
        ];
      };

      "nvim" = {
        name = "Neovim wrapper";
        genericName = "Text Editor";
        comment = "Edit text files";
        exec = "kitty --app-id kitty-nvim -e nvim %F";
        icon = "nvim";
        type = "Application";
        terminal = false;
        categories = [
          "Utility"
          "TextEditor"
          "Development"
        ];
        mimeType = [ "text/plain" ];
      };
    };
  };

  # don't change this
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
