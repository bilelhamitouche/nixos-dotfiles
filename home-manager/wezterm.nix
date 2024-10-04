{ config, pkgs, ... }:

let
  themes = {
    Ayu = "Ayu Dark (Gogh)";
    Catppuccin = "Catppuccin Mocha";
    Dracula = "Dracula (Official)";
    Everforest = "Everforest Dark Medium (Gogh)";
    GruvboxDark = "GruvboxDark";
    Kanagawa = "Kanagawa";
    Monokai = "Monokai (base16)";
    MonokaiPro = "Monokai Pro (Gogh)";
    Nord = "Nord (Gogh)";
    Nightfox = "nightfox";
    OneDark = "OneDark (base16)";
    RosePine = "rose-pine";
    Solarized = "Solarized (dark) (terminal.sexy)";
    TokyoNight = "Tokyo Night";
    Vscode = "Dark+";
    Zenburn = "Zenburn";
  };
  currentTheme = "Everforest";
  themeColors = themes.${currentTheme};
in
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" }),
        font_size = 11.0,
        line_height = 1.3,
        default_cursor_style = "BlinkingBar",
        color_scheme = "${themeColors}",
        enable_tab_bar = false,
        enable_wayland = false,
      }
    '';
  };
}
