{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    package = pkgs.fishMinimal;
    shellAliases =
      let
        flakeDir = "~/.dotfiles";
      in
      {
        rbs = "sudo nixos-rebuild switch --flake ${flakeDir}";
        rbb = "sudo nixos-rebuild boot --flake ${flakeDir}";
        upd = "sudo nix flake update --flake ${flakeDir}";
        nixgrb = "sudo nix-collect-garbage -d";
        pkgs = "v ${flakeDir}/nixos/packages.nix";
        v = "nvim";
        rm = "rm -i";
        ls = "eza --icons=auto";
        ll = "eza -l --icons=auto";
        la = "eza -la --icons=auto";
        lt = "eza --tree --icons=auto";
        llt = "eza -l --tree --icons=auto";
        y = "yazi";
        b = "btop";
        cat = "bat";
        t = "timer";
        f = "fastfetch";
        py = "python";
        find = "fd";
        niriconf = "nvim ${flakeDir}/config/niri/config.kdl";
        flake = "nvim ${flakeDir}/flake.nix";
        warp-on = "warp-cli connect";
        warp-off = "warp-cli disconnect";
        warp-status = "warp-cli status";
      };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "git-abbr";
        src = pkgs.fishPlugins.git-abbr.src;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
    ];

    interactiveShellInit = ''
      set -U fish_greeting ""
      fish_add_path $HOME/.local/bin
      function printf
        if test (count $argv) -gt 0; and string match -q '*2J*' -- "$argv[1]"
          clear
        else
          builtin printf $argv
        end
      end
    '';
  };
}
