let
  me = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXTJ9j2M7DwF4X5pLGS09OM0oCiIsdErt8BW0zLNg9T";
in
{
  "nixos/secrets/github.age".publicKeys = [ me ];
  "nixos/secrets/codeberg.age".publicKeys = [ me ];
  "nixos/secrets/tg-ws-proxy.age".publicKeys = [ me ];
  "nixos/secrets/password.age".publicKeys = [ me ];
  "nixos/secrets/github-token.age".publicKeys = [ me ];
}
