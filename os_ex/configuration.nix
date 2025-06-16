{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = programs.sway;
  programs.sway.enable = true;

  system.stateVersion = "25.05";
  users.users.maftun = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "test";
  };
  environment.systemPackages = with pkgs; [
    cowsay
    lolcat
  ];
}

