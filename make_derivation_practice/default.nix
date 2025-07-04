let
    nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
    # pkgs = import nixpkgs {}; -> equivalant of:
    pkgs = import nixpkgs {config = {}; overlays = []; };
in
{
    hello = pkgs.callPackage ./hello.nix {} ;
    icat = pkgs.callPackage ./icat.nix {} ;
}