{ config, pkgs, inputs, ... }:

{
  # All my custom configs
  imports = [
    ./git.nix
    ./bash.nix
    ./niri/niri.nix
    ./helix.nix
  ];

  # Note: niri is already installed via configuration.nix
  home.packages = with pkgs; [
    librewolf
    alacritty
    # inputs.terax.packages.${pkgs.stdenv.hostPlatform.system}.terax # Terax ai editor
  ];

  # Home manager settings
  home.username = "cyanide";
  home.homeDirectory = "/home/cyanide";
  home.stateVersion = "26.05";
}
