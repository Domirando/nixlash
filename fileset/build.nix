{stdenv , lib}:
let
    fs = lib.fileset;
#    sourceFiles = fs.difference ./. (fs.maybeMissing ./result);
#    sourceFiles = fs.difference
#        ./.
#        (fs.unions [
#            (fs.maybeMissing ./result)
##            ./default.nix
##            ./build.nix
#            (fs.fileFilter (file: file.hasExt "nix") ./.)
#            ./npins
#        ]);
#    sourceFiles = fs.unions [
#            ./hello.txt
#            ./world.txt
#            ./build.sh
#            (fs.fileFilter
#                (file: file.hasExt "c" || file.hasExt "h")
#                ./src
#            )
#        ];
#    sourceFiles = fs.gitTracked ./.;
    sourceFiles =
        fs.intersection
            (fs.gitTracked ./.)
            (fs.unions [
                ./hello.txt
                ./world.txt
                ./build.sh
                ./src
            ]);

in
    fs.trace sourceFiles
    stdenv.mkDerivation {
        name = "fileset";
        src = fs.toSource{
            root = ./.;
            fileset = sourceFiles;
        };
#        postInstall = ''
#            mkdir $out
#            cp -v {hello,world}.txt $out
#        '';
        postInstall = ''
            cp -vr . $out
        '';
    }

