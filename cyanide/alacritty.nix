# Temporary alacritty nix file while terax does not work on NixOS Zaroro
{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.8;
        padding = { x = 3; y = 3; };
      };

      font = {
        normal = {
          family = "CaskaydiaCove Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "CaskaydiaCove Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "CaskaydiaCove Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "CaskaydiaCove Nerd Font";
          style = "Bold Italic";
        };
        size = 12.0;
      };

      colors = {
        # Default colors
        primary = {
          background = "#120A12"; # color0
          foreground = "#D8C8D0"; # color7
        };

        # Normal colors
        normal = {
          black   = "#120A12"; # color0
          red     = "#C7375E"; # color1
          green   = "#9A6F8D"; # color2
          yellow  = "#D47A8C"; # color3
          blue    = "#7E5470"; # color4
          magenta = "#B34F7C"; # color5
          cyan    = "#C8A2B7"; # color6
          white   = "#D8C8D0"; # color7
        };

        # Bright colors
        bright = {
          black   = "#4A2A3C"; # color8
          red     = "#E73B67"; # color9
          green   = "#B487A3"; # color10
          yellow  = "#F39AA7"; # color11
          blue    = "#A36E90"; # color12
          magenta = "#D96D9B"; # color13
          cyan    = "#E3C0D2"; # color14
          white   = "#F4EAF0"; # color15
        };
      };
    };
  };
}
