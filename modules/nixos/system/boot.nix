{
  config,
  pkgs,
  inputs,
  ...
}: {
  nix.settings = {
    substituters = [
      "https://attic.xuyh0120.win/lantian"
      "https://cache.xinux.uz"
    ];
    trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
    ];
  };
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = true;
      };
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };

    tmp.cleanOnBoot = true;

    extraModprobeConfig = ''
      options amdgpu ppfeaturemask=0xffffffff
      options v4l2loopback exclusive_caps=1 devices=1 video_nr=1 card_label="Virtual Camera"
    '';

    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-x86_64-v3;
    #kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    kernelParams = [
      "quiet"
      "splash"
      "amdgpu.ppfeaturemask=0xffffffff"
    ];
    kernelModules = [
      "v4l2loopback"
      "tun"
    ];
  };

  security.polkit.enable = true;
  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };
}
