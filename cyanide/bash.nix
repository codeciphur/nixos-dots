{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake ~/dots/#laptop";
      nix-clean = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && nix-collect-garbage -d";
      # General Shortcuts:
      ll = "ls -la";
    };
  };
}
