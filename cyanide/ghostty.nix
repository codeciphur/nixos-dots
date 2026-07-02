{ config, pkgs, ... }:

let
  # Fetch the cursor trail shaders repository directly from GitHub
  ghostty-cursor-shaders = pkgs.fetchFromGitHub {
    owner = "sahaj-b";
    repo = "ghostty-cursor-shaders";
    rev = "main"; 
    hash = "sha256-B7B6K7Ee4uJlW8zzLP3ILgddnbcIQyNimY+rVllzbR0=";
  };
in
{
  programs.ghostty = {
    enable = true;

    settings = {
      font-size = 12;
      font-family = "CaskaydiaCove Nerd Font";
      theme = "jabami-yumeko";
      background-opacity = 0.8;
      background-blur = true;
      window-padding-x = 2;
      window-padding-y = 1;
      # window-decoration = "auto";
      #window-decoration = "none";

      keybind = [
        "ctrl+1=goto_tab:1"
        "ctrl+2=goto_tab:2"
        "ctrl+3=goto_tab:3"
        "ctrl+4=goto_tab:4"
        "ctrl+5=goto_tab:5"
        "ctrl+6=goto_tab:6"
        "ctrl+7=goto_tab:7"
        "ctrl+8=goto_tab:8"
        "ctrl+h=new_split:right"
        "ctrl+j=new_split:down"
        "ctrl+shift+h=goto_split:left"
        "ctrl+shift+j=goto_split:down"
        "ctrl+shift+k=goto_split:up"
        "ctrl+shift+l=goto_split:right"
        "ctrl+alt+h=resize_split:left,10"
        "ctrl+alt+j=resize_split:down,10"
        "ctrl+alt+k=resize_split:up,10"
        "ctrl+alt+l=resize_split:right,10"
        "ctrl+shift+q=quit"
        "ctrl+t=new_tab"
      ];

      # --- Cursor Shaders Configuration ---
      # Choose your preferred effect by pointing to the specific .glsl file
      custom-shader = "${ghostty-cursor-shaders}/cursor_tail.glsl";
      
      # Optional: if you use a line cursor or experience freezing when unfocused
      custom-shader-animation = "always";
    };

    themes = {
      jabami-yumeko = {
        background = "0d0406"; # Deepest dark shadow tone
        foreground = "e5d4dc"; # Soft off-white from Yumeko's shirt
        cursor-color = "ff2e43"; # Lethal neon glow from her eyes
        selection-background = "3d131a"; # Deep burgundy shadow
        selection-foreground = "e5d4dc"; 

        palette = [
          "0=#18090d" # Normal Black: Very dark charcoal red
          "1=#9a141d" # Normal Red: Hyakkaou Academy blazer crimson
          "2=#56232d" # Normal Green: Dark muted wine
          "3=#d64550" # Normal Yellow: Vibrant blood red
          "4=#3d131a" # Normal Blue: Deep burgundy shadow
          "5=#be1c31" # Normal Magenta: Intense, chaotic red
          "6=#a68c96" # Normal Cyan: Muted ash-lavender hair highlights
          "7=#c2b0b8" # Normal White: Desaturated grey-white
          "8=#2c1116" # Bright Black: Brighter shadow tone
          "9=#ff2e43" # Bright Red: Glowing red eye neon
          "10=#7c3543" # Bright Green: Lighter wine tone
          "11=#ff5967" # Bright Yellow: Bright, intense coral red
          "12=#5c1e29" # Bright Blue: Mid-tone burgundy
          "13=#e02840" # Bright Magenta: High-saturation poker-chip red
          "14=#decad3" # Bright Cyan: High-contrast ash-grey
          "15=#f2e6eb" # Bright White: Purest highlight white from text graphic
        ];
      };
    };
  };
}
