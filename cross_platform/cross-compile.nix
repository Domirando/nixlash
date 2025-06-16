let
    nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/release-23.11";
    pkgs = import nixpkgs {};
    helloWorld = pkgs.writeText "hello.c" ''
        #include <stdio.h>
        int main (void)
        {
        printf ("Hello, world!\n");
        return 0;
        }
    '';
    crossCompileFor = hostPkgs:
        hostPkgs.runCommandCC "hello-world-cross-test" {} ''
            # Wine requires home directory
            HOME=$PWD

            # Compile our example using the compiler specific to our host platform
            $CC ${helloWorld} -o hello

            ${hostPkgs.stdenv.hostPlatform.emulator hostPkgs.buildPackages} hello > $out
            cat $out
        '';
in {
    rpi = crossCompileFor pkgs.pkgsCross.raspberryPi;
    windows = crossCompileFor pkgs.pkgsCross.mingwW64;
}