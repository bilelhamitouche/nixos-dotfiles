{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font("JetBrainsMono Nerd Font"),
        font_size = 11.0,
        color_scheme = "Catppuccin Mocha",
        enable_tab_bar = false,
        enable_wayland = false,
      }
    '';
  };
}
