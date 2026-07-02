{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    # 🔧 Default open configurations
    settings = {
      opener = {
        helix_current = [
          { run = ''hx "$@"''; block = true; desc = "Helix (Current Window)"; }
        ];
      };
      open = {
        rules = [
          { mime = "text/*"; use = "helix_current"; }
          { mime = "application/json"; use = "helix_current"; }
          { mime = "application/x-javascript"; use = "helix_current"; }
          # Fixed: Correct catch-all syntax for any file type matching Yazi's engine
          { mime = "*"; use = "helix_current"; }
        ];
      };
    };

    # ⌨️ Keybindings configuration
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "e" ]; 
          run = ''shell "ghostty -e hx \"$@\" 2> ~/yazi_error.log" --fork'';
          desc = "Open selected file in Helix inside a new Ghostty window";
        }
      ];
    };

    # 🎨 Transparency & Jabami Yumeko Theme Configuration
    theme = {
      manager = {
        # bg attributes removed globally
        cursor = { fg = "#0d0406"; bg = "#ff2e43"; bold = true; };
        selected = { fg = "#f2e6eb"; bg = "#3d131a"; italic = true; };
        hovered = { fg = "#0d0406"; bg = "#c2b0b8"; };
        border  = { fg = "#5c1e29"; };
      };

      status = {
        separator_open  = "";
        separator_close = "";
        
        mode_normal = { fg = "#0d0406"; bg = "#9a141d"; bold = true; };
        mode_select = { fg = "#0d0406"; bg = "#ff5967"; bold = true; };
        mode_unset  = { fg = "#0d0406"; bg = "#3d131a"; bold = true; };

        progress_normal = { fg = "#ff2e43"; };
        progress_error  = { fg = "#9a141d"; };
      };

      input = {
        border = { fg = "#ff2e43"; };
        title  = { fg = "#f2e6eb"; };
        value  = { fg = "#e5d4dc"; };
        selected = { bg = "#3d131a"; };
      };

      filetype = {
        rules = [
          { url = "*/"; fg = "#9a141d"; bold = true; }
          { mime = "image/*"; fg = "#ff5967"; }
          { mime = "video/*"; fg = "#be1c31"; }
          { mime = "audio/*"; fg = "#e02840"; }
          { mime = "text/*"; fg = "#e5d4dc"; }
          { mime = "application/json"; fg = "#decad3"; }
          { mime = "application/x-javascript"; fg = "#decad3"; }
          { mime = "application/*zip"; fg = "#a68c96"; }
          { mime = "application/x-tar"; fg = "#a68c96"; }
          { url = "*"; fg = "#c2b0b8"; }
        ];
      };
    };
  };
}
