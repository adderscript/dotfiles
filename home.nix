{ config, pkgs, ... }:

{
  home.username = "alasdair";
  home.homeDirectory = "/home/alasdair";
  home.stateVersion = "25.05";

  home.file.".config/niri".source = ./config/niri;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/foot".source = ./config/foot;
  home.file.".config/matugen".source = ./config/matugen;
  home.file.".config/nvim".source = ./config/nvim;

  programs.git = {
    enable = true;

    userName = "Alasdair Gray";
    userEmail = "alasdairthgray@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
