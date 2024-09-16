{ config, pkgs, ... }:

let
  themes = {
    Ayu = {
      background = "'#0d1017'";
      foreground = "'#ffb454'";
    };
    Catppuccin = {
      background = "'#1e1e2e'";
      foreground = "'#89b4fa'";
    };
    Dracula = {
      background = "'#282a36'";
      foreground = "'#bd93f9'";
    };
    GruvboxDark = {
      background = "'#282828'";
      foreground = "'#d79921'";
    };
    Everforest = {
      background = "'#2d353b'";
      foreground = "'#a7c080'";
    };
    Kanagawa = {
      background = "'#1f1f28'";
      foreground = "'#dca561'";
    };
    Monokai = {
      background = "'#272822'";
      foreground = "'#669def'";
    };
    MonokaiPro = {
      background = "'#2d2a2e'";
      foreground = "'#fc9867'";
    };
    Nord = {
      background = "'#2e3440'";
      foreground = "'#81a1c1'";
    };
    Nightfox = {
      background = "'#192330'";
      foreground = "'#81b29a'";
    };
    OneDark = {
      background = "'#282c34'";
      foreground = "'#98c379'";
    };
    RosePine = {
      background = "'#191724'";
      foreground = "'#9ccfd8'";
    };
    Solarized = {
      background = "'#002b36'";
      foreground = "'#859900'";
    };
    TokyoNight = {
      background = "'#1a1b26'";
      foreground = "'#7aa2f7'";
    };
  };
  currentTheme = "GruvboxDark";
  themeColors = themes.${currentTheme};
in
{
  programs.cava = {
    enable = true;
    settings = {
      general.framerate = 60;
      colors = {
        background = themeColors.background;
        foreground = themeColors.foreground;
      };
    };
  };
}
