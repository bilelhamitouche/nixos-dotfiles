{ config, pkgs, ... }:

let
  themes = {
    Ayu = {
      background = "#0d1017ff";
      foreground = "#bfbdb6ff";
      highlight = "#ffb454ff";
    };
    Catppuccin = {
      background = "#1e1e2eff";
      foreground = "#cdd6f4ff";
      highlight = "#89b4faff";
    };
    Dracula = {
      background = "#282a36ff";
      foreground = "#f8f8f2ff";
      highlight = "#bd93f9ff";
    };
    GruvboxDark = {
      background = "#282828ff";
      foreground = "#ebdbb2ff";
      highlight = "#d79921ff";
    };
    Everforest = {
      background = "#2d353bff";
      foreground = "#d3c6aaff";
      highlight = "#a7c080ff";
    };
    Kanagawa = {
      background = "#1f1f28ff";
      foreground = "#dcd7baff";
      highlight = "#76946aff";
    };
    Monokai = {
      background = "#272822ff";
      foreground = "#f8f8f2ff";
      highlight = "#66d9efff";
    };
    MonokaiPro = {
      background = "#2d2a2eff";
      foreground = "#f8f8f2ff";
      highlight = "#fc9867ff";
    };
    Nord = {
      background = "#2e3440ff";
      foreground = "#d8dee9ff";
      highlight = "#81a1c1ff";
    };
    Nightfox = {
      background = "#192330ff";
      foreground = "#cdcecfff";
      highlight = "#81b29aff";
    };
    OneDark = {
      background = "#282c34ff";
      foreground = "#abb2bfff";
      highlight = "#98c379ff";
    };
    RosePine = {
      background = "#191724ff";
      foreground = "#e0def4ff";
      highlight = "#9ccfd8ff";
    };
    Solarized = {
      background = "#002b36ff";
      foreground = "#839496ff";
      highlight = "#859900ff";
    };
    TokyoNight = {
      background = "#1a1b26ff";
      foreground = "#c0caf5ff";
      highlight = "#7aa2f7ff";
    };
    Zenburn = {
      background = "#3f3f3fff";
      foreground = "#dcdcccff";
      highlight = "#f0dfafff";
    };
  };
  currentTheme = "Catppuccin";
  themeColors = themes.${currentTheme};
in
{
  services.mako = {
    enable = true;
    font = "JetBrainsMono Nerd Font Bold 9";
    icons = true;
    textColor = themeColors.foreground;
    backgroundColor = themeColors.background;
    borderColor = themeColors.highlight;
    borderSize = 1;
    borderRadius = 3;
    extraConfig = ''
      on-button-left=dismiss
      on-button-right=dismiss-all
    '';
  };
}
