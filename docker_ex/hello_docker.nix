{ pkgs ? import <nixpkgs> {}
, pkgsLinux ? import <nixpkgs> { system = "x86_64-linux"; }
}:
pkgs.dockerTools.buildImage {
    name = "hello_docker";
    config = {
        Cmd = [ "${pkgsLinux.hello}/bin/hello" ];
    };
}