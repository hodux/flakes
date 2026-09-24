{ config, pkgs, inputs, ... }:

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
    };
  };

  programs = {
    noctalia.enable = true;
    zen-browser.enable = true;
    spicetify = {
      enable = true;
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

        "image/jpeg" = "org.pwmt.zathura.desktop";
        "image/png" = "org.pwmt.zathura.desktop";
        "image/gif" = "org.pwmt.zathura.desktop";
        "image/webp" = "org.pwmt.zathura.desktop";
        "image/svg+xml" = "org.pwmt.zathura.desktop";
        "image/bmp" = "org.pwmt.zathura.desktop";
        "image/tiff" = "org.pwmt.zathura.desktop";

        "application/pdf" = "org.pwmt.zathura.desktop";
        "application/epub+zip" = "org.pwmt.zathura.desktop";
        "application/postscript" = "org.pwmt.zathura.desktop";

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

        "video/mp4" = "vlc.desktop";
        "video/x-matroska" = "vlc.desktop";
        "video/webm" = "vlc.desktop";
        "audio/mpeg" = "vlc.desktop";
        "audio/flac" = "vlc.desktop";
        "audio/x-wav" = "vlc.desktop";

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

      # temp fix for popups' wrong positioning
      "spotify" = {
        name = "Spotify";
        genericName = "Music Player";
        comment = "Play music using Spotify";
        exec = "spotify --enable-features=UseOzonePlatform --ozone-platform=wayland";
        icon = "spotify-client";
        type = "Application";
        categories = [
          "Audio"
          "Music"
          "Player"
          "AudioVideo"
        ];
        settings = {
          StartupWMClass = "spotify";
          Version = "1.5";
        };
      };

      "lmms" = {
        name = "LMMS";
        genericName = "Digital Audio Workstation";
        comment = "Easy music creation for everyone";
        exec = "${pkgs.pipewire.jack}/bin/pw-jack ${pkgs.lmms}/bin/lmms %f";
        icon = "lmms";
        type = "Application";
        categories = [
          "AudioVideo"
          "Audio"
          "Midi"
        ];
        mimeType = [ "application/x-lmms-project" ];
        settings = {
          StartupWMClass = "lmms";
          Version = "1.5";
        };
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
