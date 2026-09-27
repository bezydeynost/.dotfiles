{
  networking = {
    hostName = "femboy";
    networkmanager.enable = true;
    nftables.enable = true;
    firewall.enable = false;
  };

  programs.throne = {
    enable = true;
    tunMode = {
      enable = true;
      setuid = true;
    };
  };

  services.zapret-discord-youtube = {
    enable = true;
    configName = "general(ALT9)";
    gameFilter = "null";
  };

  systemd.services.zapret-discord-youtube.after = ["network.target"];
  systemd.services.zapret-discord-youtube.wants = ["network.target"];
}
