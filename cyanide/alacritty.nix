# Temporary alacritty nix file while terax does not work on NixOS Zarara
{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.8;
        padding = { x = 5; y = 5; };
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
          background = "#0d0406"; # Deepest dark shadow tone from the edges
          foreground = "#e5d4dc"; # Soft off-white from Yumeko's collared shirt
        };

        # Normal colors
        normal = {
          black   = "#18090d"; # Very dark charcoal red/black
          red     = "#9a141d"; # Rich crimson from her Hyakkaou Academy blazer
          green   = "#56232d"; # Dark muted wine (acts as a subtle accent)
          yellow  = "#d64550"; # Vibrant blood red
          blue    = "#3d131a"; # Deep burgundy shadow
          magenta = "#be1c31"; # Intense, chaotic magenta-leaning red
          cyan    = "#a68c96"; # Muted ash-lavender from her hair highlights
          white   = "#c2b0b8"; # Clean, slightly desaturated grey-white
        };

        # Bright colors
        bright = {
          black   = "#2c1116"; # Brighter shadow tone
          red     = "#ff2e43"; # Lethal neon glow from her glowing red eyes 
          green   = "#7c3543"; # Lighter wine tone
          yellow  = "#ff5967"; # Bright, intense coral red
          blue    = "#5c1e29"; # Mid-tone burgundy
          magenta = "#e02840"; # High-saturation poker-chip red
          cyan    = "#decad3"; # High-contrast ash-grey
          white   = "#f2e6eb"; # Purest highlight white from the text graphic
        };
      };
    };
  };
}
