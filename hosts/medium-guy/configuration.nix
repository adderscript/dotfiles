{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix

    ../../modules/users.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "medium-guy";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  nixpkgs.config.allowUnfree = true;

  programs.niri.enable = true;
  programs.fish.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    unzip

    gcc
    brightnessctl
    xwayland-satellite

    niri
    matugen
    swaybg
    waybar
    quickshell
    foot
    fuzzel
    mako

    inputs.zen-browser.packages."${system}".default
    steam
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}
