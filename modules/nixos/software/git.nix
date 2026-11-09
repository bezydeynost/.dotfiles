{ pkgs, ... }: {
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "bezydeynost";
        email = "120014445+bezydeynost@users.noreply.github.com";
      };
    };
  };
}
