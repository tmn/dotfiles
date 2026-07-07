{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap"; # zap;
      autoUpdate = true;
      upgrade = true;

      extraFlags = ["--force-cleanup"];
    };

    brews = [
      "ffmpeg"
      "colima"
      "editorconfig"
      "yt-dlp"
    ];
    casks = [
      "ghostty"
      "vlc"
    ];
  };
}