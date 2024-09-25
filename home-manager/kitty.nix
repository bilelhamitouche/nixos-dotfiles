{
  config,
  lib,
  pkgs,
  ...
}:

let
  themes = {
    Ayu = "Ayu";
    Catppuccin = "Catppuccin-Mocha";
    Dracula = "Dracula";
    GruvboxDark = "Gruvbox Dark";
    Everforest = "Everforest Dark Medium";
    Kanagawa = "Kanagawa";
    Monokai = "Monokai";
    MonokaiPro = "Monokai Pro";
    Nord = "Nord";
    Nightfox = "Nightfox";
    OneDark = "One Dark";
    RosePine = "Rosé Pine";
    Solarized = "Solarized Dark";
    TokyoNight = "Tokyo Night";
    Zenburn = "Zenburn";
  };
  currentTheme = "Catppuccin";
  themeColors = themes.${currentTheme};
  option = if currentTheme == "MonokaiPro" then "background #2d2a2e" else "#background ''";
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = "CaskaydiaCove NF Bold";
      size = 11.5;
    };
    theme = themeColors;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      window_padding_width = 4;
      text_composition_strategy = "legacy";
      confirm_os_window_close = 0;
    };
    extraConfig = ''
      ${option}
      modify_font cell_height 6px
    '';
  };
}
