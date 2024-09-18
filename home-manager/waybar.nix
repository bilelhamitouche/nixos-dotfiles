{ config, pkgs, ... }:

let
  themes = {
    Ayu = {
      background = "#0d1017";
      foreground = "#bfbdb6";
      red = "#f07178";
      green = "#aad94c";
      yellow = "#ffb454";
      orange = "#ffbf40";
      blue = "#39bae6";
      magenta = "#c792ea";
      cyan = "#59c2ff";
      gray = "#475266";
      inactive = "#475266";
      active = "#ffb454";
    };
    Catppuccin = {
      background = "#1e1e2e";
      foreground = "#cdd6f4";
      red = "#f38ba8";
      green = "#a6e3a1";
      yellow = "#f9e2af";
      orange = "#fab387";
      blue = "#89b4fa";
      magenta = "#cba6f7";
      cyan = "#89dceb";
      gray = "#45475a";
      inactive = "#45475a";
      active = "#89b4fa";
    };
    Dracula = {
      background = "#282a36";
      foreground = "#f2f2f2";
      red = "#ff5555";
      green = "#50fa7b";
      yellow = "#f1fa8c";
      orange = "#ffb86c";
      blue = "#bd93f9";
      magenta = "#ff79c6";
      cyan = "#8be9fd";
      gray = "#44475a";
      inactive = "#44475a";
      active = "#bd93f9";
    };
    GruvboxDark = {
      background = "#282828";
      foreground = "#ebdbb2";
      red = "#cc241d";
      green = "#98971a";
      yellow = "#d79921";
      orange = "#d65d0e";
      blue = "#458588";
      magenta = "#b16286";
      cyan = "#689d6a";
      gray = "#928374";
      inactive = "#928374";
      active = "#d79921";
    };
    Everforest = {
      background = "#2d353b";
      foreground = "#d3c6aa";
      red = "#e67e80";
      green = "#a7c080";
      yellow = "#dbbc7f";
      orange = "#e69875";
      blue = "#7fbbb3";
      magenta = "#d699b6";
      cyan = "#83c092";
      gray = "#859289";
      inactive = "#859289";
      active = "#a7c080";
    };
    Kanagawa = {
      background = "#1f1f28";
      foreground = "#dcd7ba";
      red = "#c34043";
      green = "#76946a";
      yellow = "#dca561";
      orange = "#e82424";
      blue = "#2d4f67";
      magenta = "#957fb8";
      cyan = "#6a9589";
      gray = "#54546d";
      inactive = "#54546d";
      active = "#76946a";
    };
    Monokai = {
      background = "#272822";
      foreground = "#f8f8f2";
      red = "#f92672";
      green = "#a6e22e";
      yellow = "#e6db74";
      orange = "#FD971F";
      blue = "#66d9ef";
      magenta = "#AE81FF";
      cyan = "#4ecdc4";
      gray = "#75715e";
      inactive = "#75715e";
      active = "#66d9ef";
    };
    MonokaiPro = {
      background = "#2d2a2e";
      foreground = "#f8f8f2";
      red = "#ff6188";
      green = "#a6e22e";
      yellow = "#e6db74";
      orange = "#f9bf6f";
      blue = "#fc9867";
      magenta = "#AE81FF";
      cyan = "#66D9EF";
      gray = "#7D8C92";
      inactive = "#7D8C92";
      active = "#fc9867";
    };
    Nord = {
      background = "#2e3440";
      foreground = "#d8dee9";
      red = "#bf616a";
      green = "#a3be8c";
      yellow = "#ebcb8b";
      orange = "#d08770";
      blue = "#81a1c1";
      magenta = "#b48ead";
      cyan = "#88c0d0";
      gray = "#4c566a";
      inactive = "#4c556a";
      active = "#81a1c1";
    };
    Nightfox = {
      background = "#192330";
      foreground = "#cdcecf";
      red = "#c94f6d";
      green = "#81b29a";
      yellow = "#dbc074";
      orange = "#e0c989";
      blue = "#719cd6";
      magenta = "#9d79d6";
      cyan = "#63cdcf";
      gray = "#575860";
      inactive = "#575860";
      active = "#81b292";
    };
    OneDark = {
      background = "#282c34";
      foreground = "#abb2bf";
      red = "#e06c7f";
      green = "#98c379";
      yellow = "#e5c07b";
      orange = "#d48588";
      blue = "#61afef";
      magenta = "#c678dd";
      cyan = "#56b6c2";
      gray = "#5b7063";
      inactive = "#5b7063";
      active = "#98c379";
    };
    RosePine = {
      background = "#191724";
      foreground = "#e0def4";
      red = "#eb6f92";
      green = "#ebbcba";
      yellow = "#f6c177";
      orange = "#f6c177";
      blue = "#9ccfd8";
      magenta = "#c4a7e7";
      cyan = "#9ccfd8";
      gray = "#6e6a86";
      inactive = "#6e6a86";
      active = "#31748f";
    };
    Solarized = {
      background = "#002b36";
      foreground = "#839496";
      red = "#dc322f";
      green = "#859900";
      yellow = "#b58900";
      orange = "#cb4b16";
      blue = "#268bd2";
      magenta = "#d33682";
      cyan = "#2aa198";
      gray = "#93a1a1";
      inactive = "#93a1a1";
      active = "#859900";
    };
    TokyoNight = {
      background = "#1a1b26";
      foreground = "#c0caf5";
      red = "#f7768e";
      green = "#9ece6a";
      yellow = "#e0af68";
      orange = "#ff9e64";
      blue = "#7aa2f7";
      magenta = "#bb9af7";
      cyan = "#7dcfff";
      gray = "#565f89";
      inactive = "#565f89";
      active = "#7aa2f7";
    };
  };
  currentTheme = "OneDark";
  themeColors = themes.${currentTheme};
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        width = 1354;
        height = 30;
        margin-top = 6;
        spacing = 8;
        modules-left = [
          "disk"
          "cpu"
          "memory"
          "temperature"
          "backlight"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "pulseaudio"
          "battery"
          "clock"
          "tray"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
        };
        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%Y-%m-%d (%H:%M)} 󰥔 ";
        };
        "cpu" = {
          format = "{usage}% 󰇄 ";
          tooltip = true;
        };
        "memory" = {
          format = "{}%  ";
        };
        "disk" = {
          format = "{free} 󰒋 ";
        };
        "temperature" = {
          format = "{} 󰔄 ";
        };
        "backlight" = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "battery" = {
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󱐋";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
        };
        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = "󰝟 {icon} {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "{volume}% ";
          format-source-muted = " ";
          format-icons = {
            headphone = " ";
            default = [
              " "
              " "
              " "
            ];
          };
          on-click = "kitty -e pulsemixer";
        };
        "tray" = {
          spacing = 10;
        };
      };
    };
    style = ''
        * {
            font-family: GeistMono Nerd Font, FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            font-size: 12px;
            font-weight: bold;
            background: rgba(0, 0, 0, 0);
        }

            window#waybar {
      	background: rgba(0, 0, 0, 0);
      	color: ${themeColors.foreground};
      	border-radius: 50px;
            }

            button {
      	border: none;
      	border-radius: 50px;
            }

            #workspaces button {
      	padding: 0 5px;
      	border-radius: 50px;
      	color: ${themeColors.foreground};
            }

            #workspaces button:hover {
              background-color: transparent;
      	box-shadow: inherit;
      	text-shadow: inherit;
            }

            #workspaces button.active {
      	background-color: ${themeColors.background};
      	color: ${themeColors.active};
            }

            #workspaces button.urgent {
      	background-color: ${themeColors.red};
            }

            #clock,
            #battery,
            #cpu,
            #memory,
            #disk,
            #temperature,
            #backlight,
            #pulseaudio,
            #tray {
      	padding: 0 10px;
      	background-color: ${themeColors.background};
      	border-radius: 50px;
            }

            #window,
            #workspaces {
      	margin: 0 4px;
      	padding: 0 10px;
      	border-radius: 50px;
      	background-color: ${themeColors.background};
            }

            .modules-left > widget:first-child > #workspaces {
      	margin-left: 0;
            }

            .modules-right > widget:last-child > #workspaces {
      	margin-right: 0;
            }

            #clock {
      	color: ${themeColors.blue};
            }

            #battery {
      	color: ${themeColors.green};
            }

            #cpu {
      	color: ${themeColors.yellow};
            }

            #memory {
      	color: ${themeColors.magenta};
            }

            #disk {
      	color: ${themeColors.cyan};
            }

            #backlight {
      	color: ${themeColors.foreground};
            }

            #pulseaudio {
      	color: ${themeColors.orange};
            }

            #temperature {
      	color: ${themeColors.red};
            }
            #tray menu menuitem:hover {
              background-color: ${themeColors.active};
              color: ${themeColors.background};
            }
            #tray menu {
              background-color: ${themeColors.background};
              color: ${themeColors.foreground};
            }

    '';
  };
}
