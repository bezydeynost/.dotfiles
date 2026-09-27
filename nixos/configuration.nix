{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos/default.nix
    ./packages.nix
    ./age.nix
    ./users.nix
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root"];
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
  };

  environment.sessionVariables = {
    TERMINAL = "foot";
  };

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
    schedsPackages = [pkgs.scx.rustscheds];
    config = {
      default_sched = "scx_bpfland";
      default_mode = "Gaming";
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
