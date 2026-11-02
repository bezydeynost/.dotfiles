{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nftables.enable = true;
    firewall.enable = false;
  };

  programs.happ = {
    enable = true;
    tunMode.enable = true;
  };

  programs.throne = {
    enable = true;
    tunMode = {
      enable = true;
      setuid = true;
    };
  };
}
