{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.proxy-suite.nixosModules.default
  ];
  services.proxy-suite = {
    enable = true;

    tgWsProxy = {
      enable = true;
      listener = {
        address = "127.0.0.1";
        port = 8443;
      };
      secretFile = config.age.secrets."nixos/secrets/tg-ws-proxy".path;
      fakeTlsDomain = "4pda.to";
    };
  };
}
