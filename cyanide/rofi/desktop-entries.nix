{ config, pkgs, ... }:

{
  # Forge custom .desktop entries that Rofi's drun mode will naturally display
  xdg.desktopEntries = {
    power-shutdown = {
      name = "Shutdown";
      comment = "Power off the system";
      exec = "systemctl poweroff";
      icon = "system-shutdown";
      categories = [ "System" ];
    };
    power-reboot = {
      name = "Reboot";
      comment = "Restart the system";
      exec = "systemctl reboot";
      icon = "system-reboot";
      categories = [ "System" ];
    };
    power-sleep = {
      name = "Sleep";
      comment = "Put the system to sleep";
      exec = "systemctl suspend";
      icon = "system-suspend";
      categories = [ "System" ];
    };
    power-logout = {
      name = "Log out (Niri)";
      comment = "Exit the current Niri session";
      exec = "niri msg action quit --skip-confirmation";
      icon = "system-log-out";
      categories = [ "System" ];
    };
  };
}
