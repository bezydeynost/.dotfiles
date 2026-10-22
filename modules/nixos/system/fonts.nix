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
}
