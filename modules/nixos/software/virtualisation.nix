{ pkgs, ... }: {
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
      };
    };

    waydroid.enable = false;

    spiceUSBRedirection.enable = true;

    libvirtd = {
      # https://nixos.wiki/wiki/Libvirt
      enable = false;
    };
  };

  # Network autostart - `virsh net-autostart default` в терминале
  programs.virt-manager.enable = true; # https://nixos.wiki/wiki/Virt-manager
}
