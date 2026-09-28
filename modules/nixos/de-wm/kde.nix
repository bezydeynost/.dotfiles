{pkgs, ...}: {
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.defaultSession = "plasma"; # KDE Plasma in Wayland
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.kdepim-runtime # Akonadi agents
    kdePackages.konsole
    kdePackages.kmahjongg
    kdePackages.kmines
    kdePackages.konversation # IRC client
    kdePackages.kpat # Solitaire
    kdePackages.ksudoku
    kdePackages.ktorrent
    kdePackages.elisa
  ];

  environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
}
