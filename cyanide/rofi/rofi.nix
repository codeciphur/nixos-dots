{ config, lib, pkgs, ... }:

let
  mkLiteral = value: {
    _type = "literal";
    inherit value;
  };

  # --- ALL MY SCRIPTS HERE ---
  # Forges a binary literally named "?" in your user profile path
  web-search-handler = pkgs.writeShellScriptBin "?" (builtins.readFile ./rofi-web-search.sh);

  # Forges the "ai" query handler for terminal text lists
  ai-query-handler = pkgs.writeShellScriptBin "ai" (builtins.readFile ./rofi-ai-handler.sh);

  # Forges the "convert" query handler for unit and currency conversion
  conversion-handler = pkgs.writeShellScriptBin "convert" (builtins.readFile ./rofi-conversion-handler.sh);
in
{
  # --- ALL MY SCRIPTS GET IMPORTED HERE ---
  home.packages = [
    # Apps
    pkgs.tela-icon-theme # icons for rofi
    pkgs.tgpt # ai intergration
    pkgs.jq # conversion
    pkgs.units # conversion
    pkgs.libnotify # powerprofile things

    # Scripts
    web-search-handler
    ai-query-handler
    conversion-handler
  ];

  imports = [
    ./desktop-entries.nix
  ];

  programs.rofi = {
    enable = true;

    # modes = [ "drun" "run" "window" "ssh" ];
    modes = [ "drun" ];

    extraConfig = {
      show-icons = true;
      icon-theme = "Tela-red-dark";
      # This line ensures that if a search doesn't match an app, hitting enter 
      # runs it as a command fallback automatically
      drun-use-desktop-cache = false;
    };

    theme = {
      "*" = {
        jabami-background = mkLiteral "#0d0406";
        jabami-foreground = mkLiteral "#e5d4dc";
        jabami-crimson = mkLiteral "#9a141d";
        jabami-eye-neon = mkLiteral "#ff2e43";
        jabami-poker-chip-red = mkLiteral "#e02840";
        jabami-ash-grey = mkLiteral "#a68c96"; # Muted tones for unselected text
        jabami-light-highlight = mkLiteral "#f2e6eb";
        jabami-selection-bg = mkLiteral "#3d131a";

        background-color = mkLiteral "transparent";
        foreground-color = mkLiteral "@jabami-foreground";
        font = "CaskaydiaCove Nerd Font 12";
      };

      "#window" = {
        background-color = mkLiteral "@jabami-background";
        border = mkLiteral "2px solid";
        border-color = mkLiteral "@jabami-eye-neon";
        border-radius = mkLiteral "8px";
        padding = mkLiteral "16px";
        width = mkLiteral "40%";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        y-offset = mkLiteral "-10%";
      };

      "#inputbar" = {
        children = map mkLiteral [ "prompt" "entry" ];
        background-color = mkLiteral "transparent";
        border = mkLiteral "0px 0px 2px 0px solid";
        border-color = mkLiteral "@jabami-crimson";
        padding = mkLiteral "8px 0px";
        margin = mkLiteral "0px 0px 12px 0px";
      };

      "#prompt" = {
        text-color = mkLiteral "@jabami-eye-neon";
        font = "CaskaydiaCove Nerd Font Bold 12";
        margin = mkLiteral "0px 12px 0px 0px";
      };

      "#entry" = {
        placeholder = "Place your bet...";
        placeholder-color = mkLiteral "@jabami-ash-grey";
        text-color = mkLiteral "@jabami-light-highlight";
      };

      "#listview" = {
        columns = 1;
        lines = 8;
        spacing = mkLiteral "6px";
        scrollbar = false;
        fixed-height = true;
      };

      "#element" = {
        border-radius = mkLiteral "4px";
        padding = mkLiteral "8px 12px";
      };

      # Normal unselected rows
      "#element.normal.normal" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@jabami-foreground";
      };

      # Selected row (Active)
      "#element.selected.normal" = {
        background-color = mkLiteral "@jabami-selection-bg";
        border = mkLiteral "1px solid";
        border-color = mkLiteral "@jabami-poker-chip-red";
        text-color = mkLiteral "@jabami-eye-neon";
      };

      # Alternate rows (makes list easier to read)
      "#element.alternate.normal" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@jabami-foreground";
      };

      "#element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };

      "#element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "24px";
        margin = mkLiteral "0px 12px 0px 0px";
      };

      # --- STYLING THE AI MESSAGE BLOCK ---
      "#message" = {
        background-color = mkLiteral "#18090d"; # Deep dark crimson charcoal from palette
        border = mkLiteral "1px solid";
        border-color = mkLiteral "@jabami-crimson";
        border-radius = mkLiteral "6px";
        padding = mkLiteral "14px";
        margin = mkLiteral "10px 0px 0px 0px";
      };


      # --- STYLING THE AI MESSAGE BLOCK ---
      "#textbox" = {
        text-color = mkLiteral "@jabami-light-highlight";
        background-color = mkLiteral "transparent";
      };
    };
  };
}
