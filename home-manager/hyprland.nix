{ config, pkgs, ... }:

let
  themes = {
    Ayu = {
      active = "rgba(ffb454ff) rgba(ffd173ff) 45deg";
      inactive = "rgba(409fffff)";
    };
    Catppuccin = {
      active = "rgba(cba6f7ff) rgba(b4befeff) 45deg";
      inactive = "rgba(45475aff)";
    };
    Dracula = {
      active = "rgba(bd93f9ff) rgba(ff79c6ff) 45deg";
      inactive = "rgba(44475aff)";
    };
    GruvboxDark = {
      active = "rgba(d79921ff) rgba(98971aff) 45deg";
      inactive = "rgba(928374ff)";
    };
    Everforest = {
      active = "rgba(a7c080ff) rgba(dbbc7fff) 45deg";
      inactive = "rgba(859289ff)";
    };
    Kanagawa = {
      active = "rgba(76946aff) rgba(2b3328ff) 45deg";
      inactive = "rgba(54546dff)";
    };
    ModusOperandi = {
      active = "rgba(0031a9ff) rgba(006800ff) 45deg";
      inactive = "rgba(595959ff)";
    };
    ModusVivendi = {
      active = "rgba(2fafffff) rgba(44bc44ff) 45deg";
      inactive = "rgba(989898ff)";
    };
    Monokai = {
      active = "rgba(6c99bbff) rgba(9e86c8ff) 45deg";
      inactive = "rgba(797979ff)";
    };
    MonokaiPro = {
      active = "rgba(FFD866ff) rgba(fc9867ff) 45deg";
      inactive = "rgba(434745ff)";
    };
    Nord = {
      active = "rgba(81a1c1ff) rgba(88c0d0ff) 45deg";
      inactive = "rgba(4c566aff)";
    };
    Nightfox = {
      active = "rgba(81b29aff) rgba(dbc074ff) 45deg";
      inactive = "rgba(575860ff)";
    };
    OneDark = {
      active = "rgba(98c379ff) rgba(e5c07bff) 45deg";
      inactive = "rgba(5b6370ff)";
    };
    RosePine = {
      active = "rgba(31748fff) rgba(c4a7e7ff) 45deg";
      inactive = "rgba(6e6a86ff)";
    };
    Solarized = {
      active = "rgba(859900ff) rgba(b58900ff) 45deg";
      inactive = "rgba(93a1a1ff)";
    };
    TokyoNight = {
      active = "rgba(7aa2f7ff) rgba(89ddffff) 45deg";
      inactive = "rgba(565f89ff)";
    };
    Vscode = {
      active = "rgba(569cd6ff) rgba(9cdcfeff) 45deg";
      inactive = "rgba(858585ff)";
    };
    Zenburn = {
      active = "rgba(f0dfafff) rgba(dfaf8fff) 45deg";
      inactive = "rgba(5f5f5fff)";
    };
  };
  currentTheme = "Monokai";
  themeColors = themes.${currentTheme};
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,auto,auto";
      exec-once = [
        "lxsession"
        "swww-daemon --format xrgb"
        "mako"
        "nm-applet"
        "blueman-applet"
        "wl-clipboard"
        "waybar"
      ];
      "$terminal" = "wezterm";
      "$fileManager" = "thunar";
      "$menu" = "fuzzel";
      env = [
        "HYPRCURSOR_THEME, Bibata-Modern-Ice"
        "XCURSOR_THEME, Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];
      general = {
        gaps_in = 3;
        gaps_out = 6;
        layout = "master";
        allow_tearing = false;
        "col.active_border" = themeColors.active;
        "col.inactive_border" = themeColors.inactive;
      };
      decoration = {
        rounding = 3;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 4, myBezier"
          "windowsOut, 1, 4, default, popin 80%"
          "border, 1, 4, default"
          "borderangle, 1, 4, default"
          "fade, 1, 4, default"
          "workspaces, 1, 4, default"
        ];
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = 0.5;
      };
      master = {
        new_status = "master";
        new_on_top = true;
        mfact = 0.5;
      };
      input = {
        kb_layout = "fr";
        numlock_by_default = true;
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
        sensitivity = 0;
      };
      "$mod" = "SUPER";
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, D, exec, discord"
        "$mod, F, fullscreen"
        "$mod, O, exec, libreoffice"
        "$mod, t, exec, /home/bilel/.local/bin/hyprland-themes.sh"
        "$mod, R, exec, $menu"
        "$mod, S, exec, grim /home/bilel/screenshots/$(date +'%s_grim.png')"
        "$mod, W, exec, flatpak run io.github.zen_browser.zen"
        "$mod SHIFT, RETURN, exec, $fileManager"
        "$mod SHIFT, M, exec, thunderbird"
        "$mod SHIFT, C, killactive"
        "$mod SHIFT, F, togglefloating"
        "$mod SHIFT, Q, exit"
        "$mod SHIFT, S, exec, grim -g '$(slurp)' /home/bilel/screenshots/$(date +'%s_grim.png')"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod SHIFT, H, swapwindow, l"
        "$mod SHIFT, L, swapwindow, r"
        "$mod SHIFT, K, swapwindow, u"
        "$mod SHIFT, J, swapwindow, d"
        "$mod, ampersand, workspace, 1"
        "$mod, eacute, workspace, 2"
        "$mod, quotedbl, workspace, 3"
        "$mod, apostrophe, workspace, 4"
        "$mod, parenleft, workspace, 5"
        "$mod, minus, workspace, 6"
        "$mod, egrave, workspace, 7"
        "$mod, underscore, workspace, 8"
        "$mod, ccedilla, workspace, 9"
        "$mod SHIFT, ampersand, movetoworkspace, 1"
        "$mod SHIFT, eacute, movetoworkspace, 2"
        "$mod SHIFT, quotedbl, movetoworkspace, 3"
        "$mod SHIFT, apostrophe, movetoworkspace, 4"
        "$mod SHIFT, parenleft, movetoworkspace, 5"
        "$mod SHIFT, minus, movetoworkspace, 6"
        "$mod SHIFT, egrave, movetoworkspace, 7"
        "$mod SHIFT, underscore, movetoworkspace, 8"
        "$mod SHIFT, ccedilla, movetoworkspace, 9"
      ];
    };
  };
}
