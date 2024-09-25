{ config, pkgs, ... }:

let
  themes = {
    Ayu = {
      background = "0d1017ff";
      foreground = "bfbdb5ff";
      highlight = "ffb454ff";
      match = "f07178ff";
    };
    Catppuccin = {
      background = "1e1e2eff";
      foreground = "cdd6f4ff";
      highlight = "89b4faff";
      match = "f38ba8ff";
    };
    Dracula = {
      background = "282a36ff";
      foreground = "f2f2f2ff";
      highlight = "bd93f9ff";
      match = "ff5555ff";
    };
    GruvboxDark = {
      background = "282828ff";
      foreground = "ebdbb2ff";
      highlight = "d79921ff";
      match = "cc241dff";
    };
    Everforest = {
      background = "2d353bff";
      foreground = "d3c6aaff";
      highlight = "a7c080ff";
      match = "e67e80ff";
    };
    Kanagawa = {
      background = "1f1f28ff";
      foreground = "dcd7baff";
      highlight = "76946aff";
      match = "dca561ff";
    };
    Monokai = {
      background = "272822ff";
      foreground = "f8f8f2ff";
      highlight = "66d9efff";
      match = "f92672ff";
    };
    MonokaiPro = {
      background = "2d2a2eff";
      foreground = "f8f8f2ff";
      highlight = "fc9867ff";
      match = "ff6188ff";
    };
    Nord = {
      background = "2e3440ff";
      foreground = "d8dee9ff";
      highlight = "81a1c1ff";
      match = "bf616aff";
    };
    Nightfox = {
      background = "192330ff";
      foreground = "cdcecfff";
      highlight = "81b29aff";
      match = "c94f6dff";
    };
    OneDark = {
      background = "282c34ff";
      foreground = "abb2bfff";
      highlight = "98c379ff";
      match = "e06c75ff";
    };
    RosePine = {
      background = "191724ff";
      foreground = "e0def4ff";
      highlight = "9ccfd8ff";
      match = "eb6f92ff";
    };
    Solarized = {
      background = "002b36ff";
      foreground = "839496ff";
      highlight = "859900ff";
      match = "dc322fff";
    };
    TokyoNight = {
      background = "1a1b26ff";
      foreground = "c0caf5ff";
      highlight = "7aa2f7ff";
      match = "f7768eff";
    };
    Zenburn = {
      background = "1a1b26ff";
      foreground = "c0caf5ff";
      highlight = "7aa2f7ff";
      match = "f7768eff";
    };
  };
  currentTheme = "Catppuccin";
  themeColors = themes.${currentTheme};
in
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "CaskaydiaCove Nerd Font:bold:size=10";
        icons-enabled = true;
        fuzzy = true;
        anchor = "center";
        lines = 15;
        width = 35;
        horizontal-pad = 40;
        vertical-pad = 8;
        inner-pad = 8;
        line-height = 18;
      };
      colors = {
        background = themeColors.background;
        text = themeColors.foreground;
        selection = themeColors.highlight;
        selection-text = themeColors.background;
        selection-match = themeColors.match;
        match = themeColors.match;
        border = themeColors.highlight;
      };
      border = {
        width = 1;
        radius = 3;
      };
    };
  };
}
