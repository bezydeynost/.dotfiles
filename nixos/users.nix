{
  config,
  pkgs,
  ...
}:
let
  username = "bezydeynost";
in
{
  programs.fish.enable = true;
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "libvirtd"
      "storage"
      "docker"
      "video"
      "i2c"
      "adbusers"
      "plugdev"
    ];
    shell = pkgs.fishMinimal;
    hashedPasswordFile = config.age.secrets."password".path;
  };
}
