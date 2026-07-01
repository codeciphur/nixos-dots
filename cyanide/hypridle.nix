{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hypridle
  ];

  services.hypridle = {
    enable = true;

    settings = {
      listener = [
        # After 2 minutes of inactivity, call hyprlock
        {
          on-timeout = "hyprlock";
          timeout = 120;
        }
        # After 3 minutes of inactivity (1 minute after hyprlock), put device to sleep
        {
          on-timeout = "systemctl suspend";
          timeout = 180;
        }
      ];
    };
  };
}
