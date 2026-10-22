{ inputs, ... }: {
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
      "com.github.taiko2k.tauonmb"
      "ru.linux_gaming.PortProton"
    ];
  };
}
