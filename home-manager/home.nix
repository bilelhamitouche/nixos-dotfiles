{ config, pkgs, ... }:

{

  imports = [
    ./bash.nix
    ./git.nix
    ./gtk.nix
    ./fuzzel.nix
    ./hyprland.nix
    ./kitty.nix
    ./lazygit.nix
    ./mako.nix
    ./neovim.nix
    ./tmux.nix
    ./waybar.nix
  ];

  # User information
  home.username = "bilel";
  home.homeDirectory = "/home/bilel";

  # This value determines the Home Manager release that your configuration is
  home.stateVersion = "24.05";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [ ];

  # Home Manager is pretty good at managing dotfiles.
  home.file = { };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
