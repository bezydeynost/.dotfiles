{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos/default.nix
    ./packages.nix
    ./age.nix
    ./users.nix
  ];

  nix = {
    settings = {
      substituters = [ "https://mirror.yandex.ru/nixos" ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [ "root" ];
      auto-optimise-store = true;
      warn-dirty = false;
    };
  };

  services = {
    fast-nix-gc = {
      enable = true;
      automatic = true;
      dates = "weekly";
      deleteOlderThan = "14d";
    };
    fast-nix-optimise = {
      enable = true;
      automatic = true;
      dates = "weekly";
    };
  };

  environment.sessionVariables = {
    TERMINAL = "foot";
  };

  environment.etc."xdg/xdg-terminals.list".text = ''
    foot.desktop
  '';

  environment.localBinInPath = true;

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.stable-packages
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  security.polkit = {
    enable = true;
  };

  hardware.bluetooth = {
    enable = true;
  };

  services.scx-loader = {
    enable = true;
    config = {
      default_sched = "scx_cosmos";
      default_mode = "Auto";
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 20;
    priority = 100;
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  system.stateVersion = "26.11";
}
