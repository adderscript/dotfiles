{ pkgs, ... }:

{
  users.users.alasdair = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      firefox
    ];

    shell = pkgs.fish;
  };
}
