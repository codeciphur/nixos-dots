{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "/home/cyanide/dots/cyanide/fastfetch/fastfetch-yumeko-image.png";
        type = "kitty";
        height = 18;
        width = 36;
        padding = {
          left = 2;
          right = 4;
        };
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        # color = "blue";
        separator = " ";
      };
      modules = [
        {
          key = "╭───────────╮";
          type = "custom";
        }
        {
          key = "│  user    │";
          type = "title";
          format = "{user-name}";
        }
        {
          key = "│ 󰇅 hname   │";
          type = "title";
          format = "{host-name}";
        }
        {
          key = "│ 󰅐 uptime  │";
          type = "uptime";
        }
        {
          key = "│  distro  │";
          type = "os";
        }
        {
          key = "│  kernel  │";
          type = "kernel";
        }
        {
          key = "│  wm      │";
          type = "wm";
        }
        {
          key = "│  term    │";
          type = "terminal";
        }
        {
          key = "│  shell   │";
          type = "shell";
        }
        {
          key = "├───────────┤";
          type = "custom";
        }
        {
          key = "│ PC        │";
          type = "host";
          format = "{5} {1} ({2})";
        }
        {
          key = "│ ├ 󰍛 cpu   │";
          type = "cpu";
          showPeCoreCount = true;
        }
        {
          key = "│ ├ 󰢮 gpu   │";
          type = "gpu";
          format = "{1} {2} @ {12}";
        }
        # {
        #   key = "│ ├ 󰓡 swap  │";
        #   type = "swap";
        # }
        {
          key = "│ ├ 󰉉 disk  │";
          type = "disk";
          folders = "/";
        }
        {
          key = "│ ├  ram   │";
          type = "memory";
        }
        {
          key = "│ ├  disp  │";
          type = "monitor";
          format = "{width}x{height} @ {refresh-rate} Hz";

        }
        {
          key = "│  colors  │";
          type = "colors";
          symbol = "circle";
        }
        {
          key = "│ 󱢡 yumeko  │ かけぐるいましょう";
          type = "custom";
        }
        {
          key = "╰───────────╯";
          type = "custom";
        }
        # "break"
        # "player"
        # "media"
      ];
    };
  };
}
