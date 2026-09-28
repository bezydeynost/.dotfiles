{inputs, ...}: {
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];
  services.flatpak = {
    enable = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    packages = [
      "org.freedownloadmanager.Manager"
      "us.zoom.Zoom"
      "com.github.taiko2k.tauonmb"
    ];
  };
}
