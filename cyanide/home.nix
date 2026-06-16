{ config, pkgs, inputs, ... }:

{
  # All my custom configs
  imports = [
    ./git.nix
    ./bash.nix
    ./niri/niri.nix
    ./helix.nix
    ./alacritty.nix
    ./starship.nix
  ];

  # Note: niri is already installed via configuration.nix
  home.packages = with pkgs; [
    librewolf
    alacritty
    awww
    starship
    # nerd-fonts.jetbrains-mono
    # source-code-pro
    # nerd-fonts.blex-mono
    nerd-fonts.caskaydia-cove
    # inputs.terax.packages.${pkgs.stdenv.hostPlatform.system}.terax # Terax ai editor
  ];

  fonts.fontconfig.enable = true;

  # Home manager settings
  home.username = "cyanide";
  home.homeDirectory = "/home/cyanide";
  home.stateVersion = "26.05";
}
