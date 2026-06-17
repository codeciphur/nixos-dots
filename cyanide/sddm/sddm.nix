{ pkgs, ... }:

let
  custom-astronaut = pkgs.sddm-astronaut.override { 
    embeddedTheme = "black_hole";
    
    themeConfig = {
      # Background Configuration
      Background = toString ./the-scarlet-devil-live-wallpaper.mp4;
      FormPosition = "left";

      # Text Colors (Crisp white time, muted clean gray date/header)
      TimeTextColor = "#FFFFFF";
      DateTextColor = "#888888";
      HeaderTextColor = "#888888";

      # Form / Panels Backgrounds (Absolute Dead Black)
      FormBackgroundColor = "#000000";
      BackgroundColor = "#000000";
      DimBackgroundColor = "#000000";

      # Input Fields (Deep stealth black with subtle gray borders)
      LoginFieldBackgroundColor = "#0A0A0A";
      PasswordFieldBackgroundColor = "#0A0A0A";
      LoginFieldTextColor = "#FFFFFF";
      PasswordFieldTextColor = "#FFFFFF";
      UserIconColor = "#888888";
      PasswordIconColor = "#888888";
      PlaceholderTextColor = "#444444";
      WarningColor = "#FF5500";

      # Action Buttons (Fiery Halo Orange-Red Accent)
      LoginButtonTextColor = "#000000";
      LoginButtonBackgroundColor = "#FF5500";
      SystemButtonsIconsColor = "#888888";
      SessionButtonTextColor = "#888888";
      VirtualKeyboardButtonTextColor = "#888888";

      # Session Dropdown Selectors
      DropdownTextColor = "#FFFFFF";
      DropdownSelectedBackgroundColor = "#FF5500";
      DropdownBackgroundColor = "#0A0A0A";

      # Text Highlighting/Selection
      HighlightTextColor = "#000000";
      HighlightBackgroundColor = "#FF5500";
      HighlightBorderColor = "#FF5500";

      # Interactive Hover States (Ignites the elements into the halo color)
      HoverUserIconColor = "#FF5500";
      HoverPasswordIconColor = "#FF5500";
      HoverSystemButtonsIconsColor = "#FF5500";
      HoverSessionButtonTextColor = "#FF5500";
      HoverVirtualKeyboardButtonTextColor = "#FF5500";
    };
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    
    theme = "sddm-astronaut-theme";

    extraPackages = [
      custom-astronaut
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qt5compat
    ];
  };

  environment.systemPackages = [
    custom-astronaut
    pkgs.ffmpeg
  ];
}
