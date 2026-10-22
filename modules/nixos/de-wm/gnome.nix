{ pkgs, ... }:
{
  services = {
    xserver.enable = true;
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "gnome";
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnome-extension-manager
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.just-perfection
  ];

  environment.gnome.excludePackages = with pkgs; [
    baobab
    epiphany
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-console
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-weather
    gnome-connections
    gnome-tour
    gnome-user-docs
    decibels
    showtime
    simple-scan
    totem
    yelp
    geary
  ];
}
