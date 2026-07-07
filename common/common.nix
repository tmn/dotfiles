{ username, user, ... }:
{
  imports = [
    ./nix-settings.nix
    ./packages.nix
  ];

  system.primaryUser = username;

  users.users.${username}.home = user.home;

  home-manager.users.${username} = {
    home.stateVersion = user.stateVersion;

    imports = [
      ../home
    ];
  };
}