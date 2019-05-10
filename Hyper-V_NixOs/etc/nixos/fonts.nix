{ config, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    corefonts
    dejavu_fonts
    freefont_ttf
    google-fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    dina-font
    proggyfonts
    powerline-fonts
#    nerdfonts
  ];
}
