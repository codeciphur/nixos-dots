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

    theme = {
      "*" = {
        jabami-background = mkLiteral "#0d0406";
        jabami-foreground = mkLiteral "#e5d4dc";
        jabami-crimson = mkLiteral "#9a141d";
        jabami-eye-neon = mkLiteral "#ff2e43";
        jabami-poker-chip-red = mkLiteral "#e02840";
        jabami-ash-grey = mkLiteral "#decad3";
        jabami-light-highlight = mkLiteral "#f2e6eb";
        jabami-selection-bg = mkLiteral "#3d131a";

        background-color = mkLiteral "@jabami-background";
        foreground-color = mkLiteral "@jabami-foreground";
        border-color = mkLiteral "@jabami-eye-neon";
        separator-color = mkLiteral "@jabami-eye-neon";
        font = "CaskaydiaCove Nerd Font 12";
      };

      "#window" = {
        background-color = mkLiteral "@jabami-background";
        border = mkLiteral "1px solid";
        border-radius = mkLiteral "6px";
        padding = mkLiteral "12px";
        width = mkLiteral "40%";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        y-offset = mkLiteral "-10%";
      };

      "#inputbar" = {
        children = map mkLiteral [ "prompt" "entry" ];
        background-color = mkLiteral "transparent";
        border = mkLiteral "0px 0px 1px 0px solid";
        border-color = mkLiteral "@separator-color";
        padding = mkLiteral "8px 12px";
        margin = mkLiteral "0px 0px 12px 0px";
      };

      "#prompt" = {
        text-color = mkLiteral "@jabami-light-highlight";
        background-color = mkLiteral "transparent";
        font = "CaskaydiaCove Nerd Font Bold 12";
        str = "♠ Dicing Fate >";
      };

      "#entry" = {
        placeholder = "Place your bet...";
        placeholder-color = mkLiteral "@jabami-ash-grey";
        text-color = mkLiteral "@jabami-light-highlight";
        background-color = mkLiteral "transparent";
      };

      "#listview" = {
        background-color = mkLiteral "transparent";
        columns = 1;
        lines = 10;
        spacing = mkLiteral "4px";
        scrollbar = false;
        padding = mkLiteral "8px 0px";
      };

      "#element" = {
        border-radius = mkLiteral "3px";
        padding = mkLiteral "6px 12px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground-color";
      };

      "#element.selected.normal" = {
        background-color = mkLiteral "@jabami-selection-bg";
        border = mkLiteral "1px solid";
        border-color = mkLiteral "@jabami-crimson";
        text-color = mkLiteral "@jabami-poker-chip-red";
      };

      "#element.alternate.normal" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@jabami-ash-grey";
      };

      "#element-icon" = {
        size = mkLiteral "24px";
        margin = mkLiteral "0px 8px 0px 0px";
      };

      "#element-text" = {
        vertical-align = mkLiteral "0.5";
      };

      "#mode-switcher" = {
        border = mkLiteral "1px 0px 0px 0px solid";
        border-color = mkLiteral "@separator-color";
        background-color = mkLiteral "transparent";
        padding = mkLiteral "8px 0px 0px 0px";
        margin = mkLiteral "12px 0px 0px 0px";
      };

      "#button" = {
        padding = mkLiteral "6px";
        border-radius = mkLiteral "3px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@jabami-ash-grey";
      };

      "#button.selected" = {
        background-color = mkLiteral "@jabami-selection-bg";
        text-color = mkLiteral "@jabami-poker-chip-red";
      };

      "#message" = {
        background-color = mkLiteral "transparent";
        border = mkLiteral "1px solid";
        border-color = mkLiteral "@separator-color";
        padding = mkLiteral "12px";
        margin = mkLiteral "12px 0px";
      };

      "#textbox" = {
        text-color = mkLiteral "@jabami-light-highlight";
        background-color = mkLiteral "transparent";
      };
    };
  };
}
