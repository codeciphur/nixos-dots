{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake ~/dots/#laptop";
      # General Shortcuts:
      ll = "ls -la";
    };
  };
}
