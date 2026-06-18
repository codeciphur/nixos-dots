{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
      };

    # Background
    background = [
      {
        monitor = "";
        # path = "/home/cyanide/dots/cyanide/wallpapers/goth-anime-girl-with-hammer-red-bg.jpg";
        path = "/home/cyanide/dots/cyanide/wallpapers/goth-anime-japanese-girl-red-bg.jpg";
        color = "rgba(0, 0, 0, 0.8)";
      }
    ];

    # Clock and date
    label = [
      # Time
      {
        text = "$TIME";
        color = "rgba(255,255,255,1.0)";
        font_size = 120;
        font_family = "CaskaydiaCove Nerd Font";

        position = "-50, 50";
        halign = "right";
        valign = "center";
      }
      # Date
      {
        text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
        color = "rgba(136,136,136,1.0)";
        font_size = 20;
        font_family = "CaskaydiaCove Nerd Font";

        position = "-110, -50";
        halign = "right";
        valign = "center";
      }
      {
        text = "$USER";
        color = "rgba(255,255,255,1.0)";
        # color = "rgb(5BC4C5)";
        font_size = 100;
        font_family = "CaskaydiaCove Nerd Font";
        position = "40, 30";
        halign = "left";
        valign = "center";
      }
      # Make "User" Vertical
      {
        text = "U";
        # color = "rgba(255,255,255,1.0)";
        color = "rgb(BA3133)";
        # color = "rgb(5BC4C5)";
        font_size = 12;
        font_family = "CaskaydiaCove Nerd Font";
        position = "287, 40";
        halign = "left";
        valign = "center";
      }
      {
        text = "S";
        # color = "rgba(255,255,255,1.0)";
        color = "rgb(BA3133)";
        # color = "rgb(5BC4C5)";
        font_size = 12;
        font_family = "CaskaydiaCove Nerd Font";
        position = "287, 25";
        halign = "left";
        valign = "center";
      }
      {
        text = "E";
        # color = "rgba(255,255,255,1.0)";
        color = "rgb(BA3133)";
        # color = "rgb(5BC4C5)";
        font_size = 12;
        font_family = "CaskaydiaCove Nerd Font";
        position = "287, 10";
        halign = "left";
        valign = "center";
      }
      {
        text = "R";
        # color = "rgba(255,255,255,1.0)";
        color = "rgb(BA3133)";
        # color = "rgb(5BC4C5)";
        font_size = 12;
        font_family = "CaskaydiaCove Nerd Font";
        position = "287, -5";
        halign = "left";
        valign = "center";
      }
    ];

    # Password input
    input-field = [
      {
        size = "300, 30";

        outline_thickness = 3;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;

        outer_color = "rgb(8C1F21)";
        inner_color = "rgb(1C1E24)";

        font_family = "CaskaydiaCove Nerd Font";

        fade_on_empty = false;

        placeholder_text = " Password ";
        # font_color = "rgba(255,255,255,1.0)";
        font_color = "rgb(C6D1D9)";

        hide_input = false;

        check_color = "rgb(0a0a0a)";
        fail_color = "rgb(ff5500)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";

        capslock_color = "rgb(ffff00)";

        position = "170, -55";
        halign = "left";
        valign = "center";
      }
    ];
  };
  };
}
