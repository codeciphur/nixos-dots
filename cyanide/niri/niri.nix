{ config, pkgs, ... }:

{
  # Use the full config file for niri found in this directory
  xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;
}
