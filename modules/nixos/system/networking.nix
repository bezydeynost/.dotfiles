{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nftables.enable = true;
    firewall.enable = false;
  };

  #services.zapret-discord-youtube = {
  #  enable = true;
  #  configName = "general(ALT9)";
  #  gameFilter = "null";
  #};

  programs.throne = {
    enable = true;
    tunMode = {
      enable = true;
      setuid = true;
    };
  };
}
