# MacOS

- nix-darwin
- home-manager

## Quick start

```nix
# Install
bash <(curl -L https://nixos.org/nix/install) --daemon

# Setup first time
sudo nix run --extra-experimental-features "nix-command flakes" nix-darwin/nix-darwin-26.05#darwin-rebuild -- switch --flake .#tequila

# Rebuild
sudo darwin-rebuild switch .#tequila
```