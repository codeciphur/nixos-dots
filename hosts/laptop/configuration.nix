# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../cyanide/sddm/sddm.nix
      # Import the terax module:
      #inputs.terax.nixosModules.terax
    ];

  # Enable Experimental, aka flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "crysis"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  hardware.bluetooth.enable = true; # enables support for Bluetooth

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."cyanide" = {
    isNormalUser = true;
    description = "cyanide";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Niri
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # Hyprlock
  security.pam.services.hyprlock = {};

  # Enable the power-profiles-daemon service
  services.power-profiles-daemon.enable = true;

  # To allow gtk applications to fetch links - this is to allow
  # SwayNC to display the correct cover art when playing through a web browser
  services.gvfs.enable = true;
  
  # Terax

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  wget
  git
  helix # Replaced evil-helix with helix - still a core system component.
  inputs.terax.packages.${pkgs.stdenv.hostPlatform.system}.terax # Terax ai editor
  xdg-desktop-portal-gtk  # Ensure a portal-compatible file chooser/theme layer is available
  ];

  # Enable XDG Desktop Portal for file picking & screensharing
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    # Force niri to use gtk instead of Gnome for file picking
    config = pkgs.lib.mkForce {
      # Enable gtk filepicking in niri
      niri = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
  };

  # This makes sure that my laptop actually stays asleep
  # by preventing ideapad_acpi from waking up s2idle on my Lenovo Laptop
  boot.kernelParams = [
    # Fixes the immediate wake issue on modern AMD Lenovo laptops
    "amd_pmc.enable_stb=1" 
  
    # Force the kernel to ignore the Embedded Controller waking up the system
    "acpi.ec_no_wakeup=1"

    # Fix the i2c_hid_acpi not initializing
    "acpi.prefer_microsoft_guid=1"
  ];

  # Ensure that Wake-On-LAN is managed correctly for best battery life while sleeping:
  networking.interfaces.enp3s0.wakeOnLan.enable = true;

  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
