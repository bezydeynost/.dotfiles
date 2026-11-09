{
  inputs,
  pkgs,
  config,
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
    optimise = {
      automatic = true;
      dates = "weekly";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      !include ${config.age.secrets."github-token".path}
    '';
  };

  services = {
    scx-loader = {
      enable = true;
      config = {
        default_sched = "scx_cosmos";
        default_mode = "Auto";
      };
    };
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };

  environment = {
    sessionVariables = {
      TERMINAL = "foot";
    };
    etc."xdg/xdg-terminals.list".text = ''
      foot.desktop
    '';
    localBinInPath = true;
  };

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

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 20;
    priority = 100;
  };

  system.stateVersion = "26.11";
}
