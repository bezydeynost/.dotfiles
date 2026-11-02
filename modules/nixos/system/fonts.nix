{
  pkgs,
  ...
}:
{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      adwaita-fonts
      noto-fonts
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
      nerd-fonts.jetbrains-mono
      nerd-fonts.noto
      nerd-fonts.symbols-only
      nerd-fonts.caskaydia-mono
      carlito
      corefonts
      terminus_font
      inconsolata
      font-awesome
      liberation_ttf
      dejavu_fonts
      unifont
      unifont_upper
      google-fonts
    ];
  };

  systemd.user.services.sync-fonts = {
    description = "Copy system fonts to ~/.local/share/fonts for OnlyOffice";
    wantedBy = [ "default.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      mkdir -p "$HOME/.local/share/fonts/nix"
      ${pkgs.rsync}/bin/rsync -rL --delete --chmod=D755,F644 \
        /run/current-system/sw/share/X11/fonts/ \
        "$HOME/.local/share/fonts/nix/"
    '';
  };
}
