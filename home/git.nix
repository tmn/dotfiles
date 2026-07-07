{
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Tri Nguyen";
        email = "mail@trimn.net";
      };

      core = {
        editor = "hx";
        excludesFile = "~/.gitignore";
      };

      color = {
        ui = true;
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };
    };
  };
}