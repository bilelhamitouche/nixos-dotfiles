{ config, pkgs, ... }:

let
  themes = {
    Ayu = "Ayu";
    Catppuccin = "Catppuccin";
    Dracula = "Dracula";
    GruvboxDark = "GruvboxDark";
    Everforest = "Everforest";
    Kanagawa = "Kanagawa";
    Monokai = "Monokai";
    MonokaiPro = "MonokaiPro";
    Nord = "Nord";
    Nightfox = "Nightfox";
    RosePine = "RosePine";
    OneDark = "OneDark";
    Solarized = "Solarized";
    TokyoNight = "TokyoNight";
  };
  iconThemes = {
    Ayu = "oomox-Ayu";
    Catppuccin = "oomox-Catppuccin";
    Dracula = "oomox-Dracula";
    GruvboxDark = "oomox-GruvboxDark";
    Everforest = "oomox-Everforest";
    Kanagawa = "oomox-Kanagawa";
    Monokai = "oomox-Monokai";
    MonokaiPro = "oomox-MonokaiPro";
    Nord = "oomox-Nord";
    Nightfox = "oomox-Nightfox";
    OneDark = "oomox-OneDark";
    RosePine = "oomox-RosePine";
    Solarized = "oomox-Solarized";
    TokyoNight = "oomox-TokyoNight";
  };
  currentTheme = "Catppuccin";
  currentIconTheme = "Catppuccin";
  themeColors = themes.${currentTheme};
  iconThemeColors = iconThemes.${currentIconTheme};
in
{
  gtk = {
    enable = true;
    theme = {
      name = themeColors;
    };
    font = {
      package = pkgs.geist-font;
      name = "Geist Medium";
      size = 11;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = iconThemeColors;
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };
}
