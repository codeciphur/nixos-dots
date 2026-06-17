{ pkgs, ... }:

let
  # This uses the package's built-in override argument to activate the black_hole flavor
  black-hole-astronaut = pkgs.sddm-astronaut.override { 
    embeddedTheme = "black_hole"; 
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    
    theme = "sddm-astronaut-theme";

    # Pass the overridden package directly into SDDM's execution environment
    extraPackages = [
      black-hole-astronaut
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qt5compat
    ];
  };

  environment.systemPackages = [
    black-hole-astronaut
  ];
}
