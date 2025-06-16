{ pkgs, modulesPath, lib, ... }: {
    imports = [
        "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ];
    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.supportedFilesystem = lib.mkForce [ "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs"];
}