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
        color = "rgba(0, 0, 0, 0,4)"
      }
    ];

    # Clock and date
    label = [
      # Time
      {
        text = "$TIME";
        color = "rgba(255,255,255,1.0)";
        font_size = 140;
        font_family = "CaskaydiaCove Nerd Font";

        position = "40, 200";
        halign = "left";
        valign = "center";
      }
      # Date
      {
        text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
        color = "rgba(136,136,136,1.0)";
        font_size = 25;
        font_family = "CaskaydiaCove Nerd Font";

        position = "80, 100";
        halign = "left";
        valign = "center";
      }
      # Logged in text
      {
        text = "󰌾 Logged in as $USER";
        color = "rgba(255,255,255,1.0)";
        font_size = 12;
        font_family = "CaskaydiaCove Nerd Font";
        position = "90, -40";
        halign = "left";
        valign = "center";
      }
    ];

    # Password input
    input-field = [
      {
        size = "300, 60";

        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;

        outer_color = "rgb(ff5500)";
        inner_color = "rgb(0a0a0a)";

        font_family = "CaskaydiaCove Nerd Font";

        fade_on_empty = false;

        placeholder_text = " Password ";
        font_color = "rgba(255,255,255,1.0)";

        hide_input = false;

        check_color = "rgb(0a0a0a)";
        fail_color = "rgb(ff5500)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";

        capslock_color = "rgb(ffff00)";

        position = "40, -100";
        halign = "left";
        valign = "center";
      }
    ];
  };
  };
}
