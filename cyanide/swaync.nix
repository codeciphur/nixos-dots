{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.swaynotificationcenter
    pkgs.brightnessctl
    pkgs.bluetui
  ];

  services.swaync = {
    enable = true;

    # --- 1. SETTINGS (Translated JSON Config) ---
    settings = {
      # "$schema" = "${pkgs.swaync}/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "top";
      cssPriority = "user";

      control-center-width = 380;
      # control-center-height = 860; 
      control-center-margin-top = 2;
      control-center-margin-bottom = 2;
      control-center-margin-right = 1;
      control-center-margin-left = 0;

      notification-window-width = 400;
      notification-icon-size = 48;
      notification-body-image-height = 160;
      notification-body-image-width = 200;

      timeout = 4;
      timeout-low = 2;
      timeout-critical = 6;
      
      fit-to-screen = true;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = false;
      script-fail-notify = true;
      
      scripts = {
        example-script = {
          exec = "echo 'Do something...'";
          urgency = "Normal";
        };
      };
      
      notification-visibility = {
        example-name = {
          state = "muted";
          urgency = "Low";
          app-name = "Spotify";
        };
      };
      
      widgets = [
        "label"
        "buttons-grid"
        "mpris"
        "volume"
        "backlight"
        "title"
        "dnd"
        "notifications"
      ];
      
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = " 󰎟 ";
        };
        dnd = {
          text = "Do not disturb";
        };
        label = {
          max-lines = 1;
          text = " ";
        };
        mpris = {
          image-size = 96;
          image-radius = 12;
        };
        volume = {
          label = "󰕾 ";
          show-per-app = false;
        };
        backlight = {
          label = "󰃠 ";
          device = "amdgpu_bl1";
          subsystem = "backlight"; 
          min = 10;
        };
        buttons-grid = {
          actions = [
            {
              label = " ";
              command = "amixer set Master toggle";
            }
            {
              label = "";
              command = "amixer set Capture toggle";
            }
            {
              label = " ";
              # command = "nm-connection-editor";
              command = "swaync-client -t -sw; ghostty --class=com.ghostty.nmtuifloat --background-opacity=1 -e nmtui";
            }
            {
              label = "󰂯";
              # command = "blueman-manager";
              command = "swaync-client -t -sw; ghostty --class=com.ghostty.bluetuifloat --background-opacity=1 -e bluetui";
            }
            {
              label = "󰏘";
              command = "nwg-look";
            }
          ];
        };
      };
    };

    # --- 2. STYLES (Combined Stylesheet with Custom Vampiric Red Colors) ---
    style = ''
      /* --- Waybar & Terminal Theme Mapping --- */
      @define-color background     #0B0405; /* Waybar background */
      @define-color background-sec #18090d; /* Terminal normal black */
      @define-color background-alt #1C080B; /* Bluetooth/Power background */
      @define-color foreground     #F2E6E7; /* Pale white text */
      
      @define-color color1         #8F6B70; /* Muted red-grey */
      @define-color color2         #8A0A19; /* Blood Red */
      @define-color color3         #D61C33; /* Mid-tone red */
      @define-color color5         #BE1C31; /* Chaotic red */
      @define-color color6         #FF152B; /* Glowing neon red */

      /* Target aliases mapped from your theme instructions */
      @define-color text            @foreground;
      @define-color selected        @color6;
      @define-color hover           #FF808E; /* Lighter red hover text */
      @define-color urgent          #FF0000; /* Pure red warning */

      /* --- Global Settings (Stripped Rounded Corners) --- */
      * {
        color: @text;
        all: unset;
        font-size: 15px;
        font-weight: bold;
        font-family: "CaskaydiaCove Nerd Font";
        transition: 200ms;
        border-radius: 0px !important; /* Forces sharp corners everywhere */
      }

      /* Avoid 'annoying' background */
      .blank-window {  
        background: transparent;  
      }

      /* --- NOTIFICATIONS STYLING --- */
      .notification-row {
        outline: none;
        margin: 0;
        padding: 0px;
      }

      .floating-notifications.background .notification-row .notification-background {
        background: rgba(11, 4, 5, 0.95);
        box-shadow: 0 0 12px rgba(255, 21, 43, 0.15);
        border: 2px solid @color2; /* Blood red border matching tooltip vibe */
        margin: 16px;
        padding: 0;
      }

      .floating-notifications.background .notification-row .notification-background .notification {
        padding: 6px;
      }

      .floating-notifications.background .notification-row .notification-background .notification.critical {
        border: 2px solid @urgent;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content {
        margin: 14px;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action {
        background-color: @background-alt;
        margin: 6px;
        border: 1px solid rgba(255, 21, 43, 0.15);
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        background-color: rgba(255, 21, 43, 0.25);
        border: 1px solid @selected;
        color: @selected;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        background-color: @selected;
        color: @background;
      }

      .image {
        margin: 10px 20px 10px 0px;
      }

      .summary {
        font-weight: 900;
        font-size: 17px;
        color: @selected; /* Matches custom-notification neon red header */
      }

      .body {
        font-size: 14px;
        color: @text;
      }

      .floating-notifications.background .notification-row .notification-background .close-button {
        margin: 6px;
        padding: 2px;
        background-color: transparent;
        border: 1px solid transparent;
      }

      .floating-notifications.background .notification-row .notification-background .close-button:hover {
        color: @selected;
      }

      .notification.critical progress {
        background-color: @urgent;
      }

      .notification.low progress,
      .notification.normal progress {
        background-color: @selected;
      }

      /* --- CONTROL CENTER STYLING --- */
      .control-center {
        background: rgba(11, 4, 5, 0.95);
        border: 3px solid rgba(255, 21, 43, 0.25); /* Subtle glowing layout boundary */
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.8);
        margin: 18px;
        padding: 12px;
      }

      .control-center .notification-row .notification-background,
      .control-center .notification-row .notification-background .notification.critical {
        background-color: @background-sec;
        border: 1px solid @color2;
        margin: 4px 0px;
        padding: 4px;
      }

      .control-center .notification-row .notification-background .notification.critical {
        color: @urgent;
      }

      .control-center .notification-row .notification-background .notification .notification-content {
        margin: 6px;
        padding: 8px 6px 2px 2px;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action {
        background: @background-alt;
        color: @text;
        margin: 6px;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        background: rgba(255, 21, 43, 0.25);
        color: @selected;
      }

      .control-center .notification-row .notification-background .close-button {
        background: transparent;
        color: @text;
        margin: 0px;
        padding: 4px;
      }

      .control-center .notification-row .notification-background .close-button:hover {
        color: @selected;
      }

      progressbar,
      progress,
      trough {
        border-radius: 0px !important;
      }

      progressbar {
        background-color: #2A1014; /* Dark red trough from your slider code */
      }

      /* --- GROUPS --- */
      .notification-group {
        margin: 2px 8px 2px 8px;
      }
      
      .notification-group-headers {
        font-weight: 900;
        font-size: 16px;
        color: @text;
        letter-spacing: 1px;
      }

      .notification-group-icon {
        color: @selected;
      }

      .notification-group-collapse-button,
      .notification-group-close-all-button {
        background: transparent;
        color: @text;
        margin: 4px; 
        padding: 4px;
      }

      .notification-group-collapse-button:hover,
      .notification-group-close-all-button:hover {
        color: @hover;
      }   

      /* --- WIDGET SUB-COMPONENTS --- */
      .widget-title {
        font-size: 16px;
        margin: 6px;
      }

      .widget-title button {
        background: @background-alt;
        padding: 4px 16px;
        border: 1px solid rgba(255, 21, 43, 0.15);
      }

      .widget-title button:hover {
        background: rgba(255, 21, 43, 0.25);
        color: @selected;
      }

      .widget-dnd {
        margin: 6px;
        font-size: 15px;
      }

      .widget-dnd > switch {
        background: @background-alt;
        font-size: initial;
        box-shadow: none;
        padding: 2px;
        border: 1px solid @color2;
      }

      .widget-dnd > switch:hover {
        background: rgba(255, 21, 43, 0.15);
      }

      .widget-dnd > switch:checked {
        background: @color2;
      }

      .widget-dnd > switch slider {
        background: @selected;
      }

      .widget-buttons-grid {
        padding: 6px 2px;
        margin: 6px;
        background: @background-sec;
        border: 1px solid rgba(255, 21, 43, 0.15);
      }

      .widget-buttons-grid>flowbox>flowboxchild>button {
        margin: 4px 10px;
        padding: 6px 12px;
        background: @background-alt;
        color: @text;
      }

      .widget-buttons-grid>flowbox>flowboxchild>button:hover {
        background: rgba(255, 21, 43, 0.25);
        color: @selected;
      }

      /* MPRIS Media Player */
      .widget-mpris {
        background: @background-sec;
        color: @text;
        margin: 20px 6px;
        border: 1px solid @color2;
      }

      .widget-mpris-player {
        background-color: @background-alt;
        padding: 6px 14px;
        margin: 6px;
      }

      .widget-mpris > box > button {
        color: @text;
      }
       
      .widget-mpris button {
        color: @color1;
      }

      .widget-mpris button:hover {
        color: @selected;
      }
       
      .widget-mpris-title {
        font-weight: 900;
        font-size: 16px;
        color: @selected;
      }
       
      .widget-mpris-subtitle {
        font-weight: bold;
        font-size: 13px;
        color: @color1;
      }

      picture.mpris-background {
        opacity: 0;
      }

      /* Audio / Volume Widget */
      .widget-volume {
        background: @background-alt;
        color: @selected;
        padding: 4px;
        margin: 6px;
        border: 1px solid rgba(255, 21, 43, 0.15);
      }

      /* ==================== VOLUME & BACKLIGHT SLIDERS ==================== */

      .widget-volume {
        background: transparent;
        padding: 12px 20px 2px 20px;
        margin: 0;
        border-radius: 0;
        border-top: 1px solid alpha(@text, .06);
      }

      .widget-backlight {
        background: transparent;
        padding: 2px 20px 12px 20px;
        margin: 0;
        border-radius: 0;
        border-top: 1px solid alpha(@text, .06);
      }

      .widget-volume trough, 
      .widget-backlight trough {
        background: alpha(@text, .08);
        border-radius: 12px;
        min-height: 8px;
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, .1);
      }

      .widget-volume highlight, 
      .widget-backlight highlight {
        background: linear-gradient(90deg, @selected 0%, alpha(@selected, .8) 100%);
        border-radius: 12px;
        box-shadow: 0 0 8px alpha(@selected, .3);
      }

      .widget-volume label, 
      .widget-backlight label {
        font-size: 29px;
        color: #f2f2f2;
        margin-right: 16px;
        margin-left: 8px;
        opacity: 0.7;
      }

      .widget-volume slider, 
      .widget-backlight slider {
        background: white;
        border-radius: 50%;
        min-height: 18px;
        min-width: 18px;
        margin: -5px 0;
        box-shadow: 
          0 2px 6px rgba(0, 0, 0, .2),
          0 0 0 2px @selected;
        transition: all 150ms cubic-bezier(0.4, 0.0, 0.2, 1);
      }

      .widget-volume slider:hover, 
      .widget-backlight slider:hover {
        min-height: 20px;
        min-width: 20px;
        box-shadow: 
          0 3px 10px rgba(0, 0, 0, .3),
          0 0 0 3px @selected;
      }
    '';
  };
}
