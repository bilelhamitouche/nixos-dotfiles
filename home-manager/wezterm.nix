{ config, pkgs, ... }:

let
  themes = {
    Ayu = "Ayu Dark (Gogh)";
    Catppuccin = "Catppuccin Mocha";
    Dracula = "Dracula (Official)";
    Everforest = "Everforest Dark (Gogh)";
    GruvboxDark = "GruvboxDark";
    Kanagawa = "Kanagawa (Gogh)";
    ModusOperandi = "Modus-Operandi";
    ModusVivendi = "Modus-Vivendi";
    Monokai = "Monokai (base16)";
    MonokaiPro = "Monokai Pro (Gogh)";
    Nord = "Nord (Gogh)";
    Nightfox = "nightfox";
    OneDark = "OneDark (base16)";
    Oxocarbon = "Oxocarbon";
    RosePine = "rose-pine";
    Solarized = "Solarized (dark) (terminal.sexy)";
    TokyoNight = "Tokyo Night";
    Vscode = "Vs Code Dark+ (Gogh)";
    Zenburn = "Zenburn";
  };
  currentTheme = "Monokai";
  themeColors = themes.${currentTheme};
in
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font("RecMonoLinear Nerd Font", { weight = "Bold" }),
        font_size = 11.0,
        line_height = 1.4,
        default_cursor_style = "BlinkingBar",
        bold_brightens_ansi_colors = "No",
        color_scheme = "${themeColors}",
        enable_tab_bar = false,
        enable_wayland = false,
        window_close_confirmation = "NeverPrompt",
      }
    '';
  };
}
