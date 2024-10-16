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
    Everforest = "Everforest Dark Medium";
    GruvboxDark = "Gruvbox Dark";
    Kanagawa = "Kanagawa";
    ModusOperandi = "Modus Operandi";
    ModusVivendi = "Modus Vivendi";
    Monokai = "Monokai";
    MonokaiPro = "Monokai Pro";
    Nord = "Nord";
    Nightfox = "Nightfox";
    OneDark = "One Dark";
    RosePine = "Rosé Pine";
    Solarized = "Solarized Dark";
    TokyoNight = "Tokyo Night";
    Vscode = "VSCode_Dark";
    Zenburn = "Zenburn";
  };
  currentTheme = "Monokai";
  themeColors = themes.${currentTheme};
  option = if currentTheme == "MonokaiPro" then "background #2d2a2e" else "#background ''";
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = "RecMonoLinear Nerd Font Bold";
      size = 11.0;
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
