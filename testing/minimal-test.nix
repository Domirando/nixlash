let
    nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
    pkgs = import nixpkgs { config = {}; overlays = []; };
in
    pkgs.testers.runNixOSTest {
        name = "minimal-test";
        nodes.machine = { config, pkgs, ... }: {
            users.users.alice = {
                isNormalUser = true;
                extraGroups = ["wheel"];
                packages = with pkgs; [
                    firefox
                    tree
                ];
        };

        system.stateVersion = "23.11";
        };

        testScript = ''
            machine.wait_for_unit("default.target")
            machine.succeed("su -- domirando -c 'which firefox'")
            machine.fail("su -- root -c 'which firefox'")
        '';
    }