{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Bilel Hamitouche";
    userEmail = "bilelhamitouche4@gmail.com";
  };
}
