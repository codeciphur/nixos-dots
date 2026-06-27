{ config, lib, pkgs, ... }:

let
  mkLiteral = value: {
    _type = "literal";
    inherit value;
  };
in
{
  programs.rofi = {
    enable = true;

    # modes = [ "drun" "run" "window" "ssh" ];
    modes = [ "drun" ];

    extraConfig = {
      show-icons = true;
      # icon-theme = "Papirus-Dark";
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

      # CRITICAL FIX: Force the text and icons to inherit the element states
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
    };
  };
}
