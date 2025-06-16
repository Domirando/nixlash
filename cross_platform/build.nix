let
    nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/release-23.11";
    pkgs = import nixpkgs {crossSystem = {config = "aarch64-multiplatform-unknown-linux-gnu";};};
in
    pkgs.hello