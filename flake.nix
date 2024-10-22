{
    description = "My game template flake";

    inputs = {
        nixpkgs = {
            url = "nixpkgs/nixos-unstable";
        };
        flake-utils = {
            url = "github:numtide/flake-utils";
        };
    };

    outputs = { nixpkgs, flake-utils, ... }:
        flake-utils.lib.eachDefaultSystem(system:
            let
                pkgs = import nixpkgs { inherit system; };
                # Example of overriding raylib:
                # pkgs = import nixpkgs { inherit system; overlays = [ (final: prev: { raylib = prev.raylib.override { sharedLib = false ;}; })]; };
            in
            {
                packages = {
                  default = pkgs.callPackage ./default.nix {};
                };

                devShells.default = pkgs.mkShell rec {
                    cLibs = with pkgs; [
                        raylib
                    ];

                    packages = with pkgs; [
                        # for debugging
                        gdb
                        # zig for attempted build of c code with zig cc
                        zig
                        # Extra dependencies needed for WASM builds
                        emscripten
                    ] ++ cLibs;

                    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath cLibs;
                };
            }
        );
}
