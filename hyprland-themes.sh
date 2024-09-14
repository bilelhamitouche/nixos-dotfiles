#!/usr/bin/env bash

declare -a themes=(
  "Ayu"
  "Catppuccin"
  "Dracula"
  "GruvboxDark"
  "Everforest"
  "Kanagawa"
  "Monokai"
  "MonokaiPro"
  "Nord"
  "Nightfox"
  "OneDark"
  "RosePine"
  "Solarized"
  "TokyoNight"
)

choice=$(printf '%s\n' "${themes[@]}" | fuzzel --dmenu)

if [ "$choice" ]; then
  # GTK
  sed -i "s/currentTheme = .*/currentTheme = \"$choice\";/g" ~/.config/nixos/home-manager/gtk.nix
  sed -i "s/currentIconTheme = .*/currentIconTheme = \"$choice\";/g" ~/.config/nixos/home-manager/gtk.nix
  # Kitty
  sed -i "s/currentTheme = .*/currentTheme = \"$choice\";/g" ~/.config/nixos/home-manager/kitty.nix
  # fuzzel
  sed -i "s/currentTheme = .*/currentTheme = \"$choice\";/g" ~/.config/nixos/home-manager/fuzzel.nix
  # Hyprland
  sed -i "s/currentTheme = .*/currentTheme = \"$choice\";/g" ~/.config/nixos/home-manager/hyprland.nix
  # mako
  sed -i "s/currentTheme = .*/currentTheme = \"$choice\";/g" ~/.config/nixos/home-manager/mako.nix
  # Neovim
  sed -i "s/currentTheme = .*/currentTheme = \"$choice\";/g" ~/.config/nixos/home-manager/neovim.nix
  # waybar
  sed -i "s/currentTheme = .*/currentTheme = \"$choice\";/g" ~/.config/nixos/home-manager/waybar.nix
  # tmux
  sed -i "s/currentTheme = .*/currentTheme = \"$choice\";/g" ~/.config/nixos/home-manager/tmux.nix
  # Home manager
  cd ~/.config/nixos/ && home-manager switch --flake .
  # Wallpaper
  swww img ~/.config/nixos/wallpapers/$choice/$(ls ~/.config/nixos/wallpapers/$choice | shuf -n1) --transition-type wave
else 
  echo "program terminated" && exit 0
fi
