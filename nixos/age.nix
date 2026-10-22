{ inputs, ... }: {
  imports = [
    inputs.agenix.nixosModules.default
  ];
  age = {
    identityPaths = [ "/etc/agenix/id_ed25519" ];
    secrets = {
      "tg-ws-proxy" = {
        file = ./secrets/tg-ws-proxy.age;
        owner = "root";
        group = "root";
        mode = "0400";
      };
      "password" = {
        file = ./secrets/password.age;
        owner = "root";
        group = "root";
        mode = "0400";
      };
      "github" = {
        file = ./secrets/github.age;
        path = "/home/bezydeynost/.ssh/github";
        owner = "bezydeynost";
        group = "users";
        mode = "0600";
      };
      "codeberg" = {
        file = ./secrets/codeberg.age;
        path = "/home/bezydeynost/.ssh/codeberg";
        owner = "bezydeynost";
        group = "users";
        mode = "0600";
      };
      "github-token" = {
        file = ./secrets/github-token.age;
        owner = "bezydeynost";
        mode = "0400";
      };
    };
  };
}
