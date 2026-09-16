{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      fontPackages = with pkgs; [liberation_ttf];
      extraCompatPackages = with pkgs; [proton-cachyos_x86_64_v3];
    };
    gamemode = {
      enable = true;
      enableRenice = true;
      settings.general = {
        desiredgov = "performance";
        renice = 10;
      };
    };
    gamescope.enable = true;
  };

  services.flatpak.packages = [
    "ru.linux_gaming.PortProton"
  ];

  environment.systemPackages = with pkgs; [
    steam-run
    mangohud
    wineWow64Packages.stable
    winetricks
    protontricks
    goverlay
    faugus-launcher
    protonplus
  ];
}
