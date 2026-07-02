{ config, pkgs, inputs, ... }:

{
  # All my custom configs
  imports = [
    ./git.nix
    ./bash.nix
    ./niri/niri.nix
    ./helix.nix
    ./starship.nix
    ./waybar/waybar.nix
    ./hyprlock.nix
    ./terax/terax.nix
    ./ghostty.nix
    ./fastfetch/fastfetch.nix
    ./rofi/rofi.nix
    ./hypridle.nix
    ./swaync.nix
  ];

  # Note: niri is already installed via configuration.nix
  home.packages = with pkgs; [
    brightnessctl # So that I can use my keys to control the brightness
    librewolf
    ghostty
    awww
    starship
    # nerd-fonts.jetbrains-mono
    # source-code-pro
    # nerd-fonts.blex-mono
    nerd-fonts.caskaydia-cove
    waybar
    hyprlock
    rofi-unwrapped # rofi-wayland
    # These two are needed for terax to render properly:
    # gsettings-desktop-schemas
    # gtk4
    fastfetch
  ];

  fonts.fontconfig.enable = true;

  # This is also for terax to render properly:
  # This dynamically appends the necessary Nix-store schema paths 
  # to your session profile regardless of your shell (bash, zsh, fish)
  home.sessionVariables = {
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk4}/share/gsettings-schemas/${pkgs.gtk4.name}";
  };

  # Home manager settings
  home.username = "cyanide";
  home.homeDirectory = "/home/cyanide";
  home.stateVersion = "26.05";
}
