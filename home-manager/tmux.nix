{ config, pkgs, ... }:

let
  themes = {
    Ayu = {
      background = "#0d1017";
      foreground = "#bfbdb6";
      highlight = "#ffb454";
      highlight2 = "#39bae6";
      gray = "#073642";
    };
    Catppuccin = {
      background = "#282a36";
      foreground = "#f8f8f2";
      highlight = "#89b4fa";
      highlight2 = "#f38ba8";
      gray = "#45475a";
    };
    Dracula = {
      background = "#282a36";
      foreground = "#f8f8f2";
      highlight = "#bd93f9";
      highlight2 = "#50fa7b";
      gray = "#44475A";
    };
    GruvboxDark = {
      background = "#282828";
      foreground = "#ebdbb2";
      highlight = "#d79921";
      highlight2 = "#689d6a";
      gray = "#3c3836";
    };
    Kanagawa = {
      background = "#272822";
      foreground = "#dcd7ba";
      highlight = "#2d4f67";
      highlight2 = "#dca561";
      gray = "#2a2a36";
    };
    Monokai = {
      background = "#272822";
      foreground = "#f8f8f2";
      highlight = "#66d9ef";
      highlight2 = "#e6db74";
      gray = "#282828";
    };
    MonokaiPro = {
      background = "#2d2a2e";
      foreground = "#f8f8f2";
      highlight = "#fc9867";
      highlight2 = "#7d8c92";
      gray = "#272822";
    };
    Nord = {
      background = "#2e3440";
      foreground = "#d8dee9";
      highlight = "#81a1c1";
      highlight2 = "#a3be8c";
      gray = "#3b4252";
    };
    Nightfox = {
      background = "#192330";
      foreground = "#cdcecf";
      highlight = "#81b29a";
      highlight2 = "#719cd6";
      gray = "#1d1d2b";
    };
    OneDark = {
      background = "#282c34";
      foreground = "#abb2bf";
      highlight = "#98c379";
      highlight2 = "#61afef";
      gray = "#31353f";
    };
    RosePine = {
      background = "#191724";
      foreground = "#e0def4";
      highlight = "#9ccfd8";
      highlight2 = "#f6c177";
      gray = "#232136";
    };
    Solarized = {
      background = "#002b36";
      foreground = "#839496";
      highlight = "#859900";
      highlight2 = "#268bd2";
      gray = "#073642";
    };
    TokyoNight = {
      background = "#1a1b26";
      foreground = "#c0caf5";
      highlight = "#7aa2f7";
      highlight2 = "#9ece6a";
      gray = "#292e42";
    };
    Zenburn = {
      background = "#3f3f3f";
      foreground = "#dcdccc";
      highlight = "#f0dfaf";
      highlight2 = "#dfaf8f";
      gray = "#4f4f4f";
    };
  };
  currentTheme = "Zenburn";
  themeColors = themes.${currentTheme};
in
{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-s";
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim \"session\"";
      }

      {
        plugin = continuum;
        extraConfig = ''
          unbind r 
          bind r source-file /home/bilel/.config/tmux/tmux.conf
          set -g @continuum-restore "on"
          set -g @continuum-save-interval 60

          set -g status on
          set -g status-interval 2
          set -g status-right-length 30

          set -g status-justify centre
          set -g status-style bg=${themeColors.gray},fg=${themeColors.foreground}

          set -g window-status-style bg=${themeColors.gray},fg=${themeColors.foreground}
          set -g window-status-format " #{window_index} #{window_name} "
          set -g window-status-current-style bg=${themeColors.highlight2},fg=${themeColors.background}
          set -g window-status-current-format " #{window_index} #{window_name} "
          set -g window-status-separator ""

          set -g status-left "#[fg=${themeColors.background},bg=${themeColors.highlight}] #S "
          set -g status-right " #[fg=${themeColors.background},bg=${themeColors.highlight}] %H:%M #[fg=${themeColors.background},bg=${themeColors.highlight}] #H "

        '';
      }
    ];
  };
}
