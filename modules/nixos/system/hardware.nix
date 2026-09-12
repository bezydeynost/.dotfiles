{pkgs, ...}: {
  hardware = {
    keyboard.qmk.enable = true;
    amdgpu.overdrive.enable = true;
    i2c.enable = true;

    enableRedistributableFirmware = true;

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva
        libva-vdpau-driver
        libvdpau-va-gl
        rocmPackages.clr.icd
      ];
    };
  };

  powerManagement.cpuFreqGovernor = "performance";

  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.enable = true;
  systemd.services.lact = {
    description = "LACT daemon";
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
  };

  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules
    qmk_hid
    via
    lact
    clinfo
    vulkan-tools
    mesa-demos
  ];

  services.udev.extraRules = ''
    # CIDOO QK75
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="36b0", ATTRS{idProduct}=="30cc", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"

    # Донгл VXE R1 SE+
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="373b", ATTRS{idProduct}=="1085", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  fileSystems = {
    "/mnt/HDD1" = {
      device = "/dev/disk/by-uuid/72fa6ecf-de34-4df9-990f-f4f85785ddf7";
      fsType = "ext4";
      options = ["defaults" "noatime" "nosuid" "nodev" "nofail" "x-gvfs-show" "noauto" "x-systemd.automount"];
    };
    "/mnt/HDD2" = {
      device = "/dev/disk/by-uuid/2f934d2b-ad39-46c8-a4ce-ea6a6b6e1912";
      fsType = "ext4";
      options = ["defaults" "noatime" "nosuid" "nodev" "nofail" "x-gvfs-show" "noauto" "x-systemd.automount"];
    };
  };
}
