{pkgs, ...}: {
  programs.fish = {
    enable = true;
    package = pkgs.fishMinimal;
    shellAliases = let
      flakeDir = "~/.dotfiles";
    in {
      rbs = "sudo nixos-rebuild switch --flake ${flakeDir}"; # Применить новый конфиг сразу
      rbb = "sudo nixos-rebuild boot --flake ${flakeDir}"; # Применить новый конфиг после ребута пк

      # Обновить все flake inputs до последних версий. Возможно это аналог "sudo pacman -Sy" на Arch Linux
      # Если после upd дописать название инпута из flake.nix, то обновится только указанный инпут
      upd = "sudo nix flake update --flake ${flakeDir}";

      # Garbage collector. Удалить все не используемые пакеты (например после обновы)
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
      grep = "rg -e";
      niriconf = "nvim ${flakeDir}/config/niri/config.kdl";
      flake = "nvim ${flakeDir}/flake.nix";
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
    '';
  };
}
