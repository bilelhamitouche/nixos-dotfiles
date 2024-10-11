{ config, pkgs, ... }:

let
  themes = {
    Ayu = "Ayu";
    Catppuccin = "Catppuccin";
    Dracula = "Dracula";
    GruvboxDark = "GruvboxDark";
    Everforest = "Everforest";
    Kanagawa = "Kanagawa";
    ModusOperandi = "ModusOperandi";
    ModusVivendi = "ModusVivendi";
    Monokai = "Monokai";
    MonokaiPro = "MonokaiPro";
    Nord = "Nord";
    Nightfox = "Nightfox";
    RosePine = "RosePine";
    OneDark = "OneDark";
    Solarized = "Solarized";
    TokyoNight = "TokyoNight";
    Vscode = "Vscode";
    Zenburn = "Zenburn";
  };
  iconThemes = {
    Ayu = "oomox-Ayu";
    Catppuccin = "oomox-Catppuccin";
    Dracula = "oomox-Dracula";
    GruvboxDark = "oomox-GruvboxDark";
    Everforest = "oomox-Everforest";
    Kanagawa = "oomox-Kanagawa";
    ModusOperandi = "oomox-ModusOperandi";
    ModusVivendi = "oomox-ModusVivendi";
    Monokai = "oomox-Monokai";
    MonokaiPro = "oomox-MonokaiPro";
    Nord = "oomox-Nord";
    Nightfox = "oomox-Nightfox";
    OneDark = "oomox-OneDark";
    RosePine = "oomox-RosePine";
    Solarized = "oomox-Solarized";
    TokyoNight = "oomox-TokyoNight";
    Vscode = "oomox-Vscode";
    Zenburn = "oomox-Zenburn";
  };
  currentTheme = "TokyoNight";
  currentIconTheme = "TokyoNight";
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
