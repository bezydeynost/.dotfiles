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

    zapret = {
      enable = true;
      engine = "zapret2";
      #engine = "zapret-discord-youtube";
      #zapret-discord-youtube.configName = "general (ALT13)";
    };

    userControl = {
      enable = true;
      group = "wheel";
    };

    tgWsProxy = {
      enable = true;
      listener = {
        address = "127.0.0.1";
        port = 8443;
      };
      secretFile = config.age.secrets."tg-ws-proxy".path;
      fakeTlsDomain = "4pda.to";
    };
  };
}
