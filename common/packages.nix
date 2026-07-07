{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    prettier
    tree-sitter
  ];
}
