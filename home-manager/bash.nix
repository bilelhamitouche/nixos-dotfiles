{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ls = "eza --icons";
      la = "eza -a --icons";
      ll = "eza -al --group-directories-first --icons";
      "l." = "eza -al --group-directories-first --icons | grep ./";
      pdw = "pwd";
      cat = "bat";
      grep = "rg";
    };
    initExtra = ''
      export XDG_DATA_DIRS="/home/bilel/.nix-profile/share:$XDG_DATA_DIRS"
      export PS1="\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
      export PATH="/home/bilel/.local/bin:$PATH"
      export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
    '';
  };
}
