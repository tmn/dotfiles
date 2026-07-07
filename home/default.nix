{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./zsh.nix
  ];

  config.home = {
    sessionPath = lib.optional (pkgs.stdenv.isDarwin && pkgs.stdenv.isAarch64) "/opt/homebrew/bin" ++ [
      "$HOME/.bin"
      "$HOME/.cargo/bin"
      "$HOME/.local/bin"
    ];

    file = {
      ".editorconfig".source = ../rc/editorconfig;
      ".gitignore".source = ../rc/gitignore;
      ".sqliterc".source = ../rc/sqliterc;

      ".config/helix" = {
        source = ../rc/helix;
        recursive = true;
      };

      ".config/ghostty" = {
        source = ../rc/ghostty;
        recursive = true;
      };
    };

    packages = with pkgs; [
      ffmpeg
      
      podman
      jansson
      mosquitto
      sqlite
    ];
  };


  config.programs = {
    bat = {
      enable = true;
      config.theme = "Monokai Extended";
    };

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };

    eza.enable = true;
    less.enable = true;
    man.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };
}