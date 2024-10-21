{
    description = "Flake for running sokol samples";

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
            in
            {
                devShells.default = pkgs.mkShell rec {
                    packages = with pkgs; [
                        # raylib dependency
                        raylib
                        # zig for attempted build of c code with zig cc
                        zig
                        # Extra dependencies needed for WASM builds
                        emscripten
                    ];

                    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath packages;
                };
            }
        );
}
