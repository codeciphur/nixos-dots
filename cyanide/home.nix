{ config, pkgs, inputs, ... }:

{
  # All my custom configs
  imports = [
    ./git.nix
    ./bash.nix
  ];

  home.packages = with pkgs; [
    niri
    librewolf
    inputs.terax.packages.${pkgs.stdenv.hostPlatform.system}.terax # Terax ai editor
  ];

  # Home manager settings
  home.username = "cyanide";
  home.homeDirectory = "/home/cyanide";
  home.stateVersion = "26.05";
}
