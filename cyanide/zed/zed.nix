{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zed-editor
  ];

  xdg.configFile."zed/settings.json".source = ./zed-settings.json;
  xdg.configFile."zed/themes".source = ./themes;
}
