{ stdenv, zig, raylib}:
let
    gameName = "mygame";
in
stdenv.mkDerivation {
    pname = gameName;
    version = "1";
    src = ./src;

    buildInputs = [ zig raylib ];

    # Needed for zig cache
    XDG_CACHE_HOME = ".cache";

    # NOTE: Add -s to zig cc command to strip executable for smaller size.
    # zig (as of 0.13) stores debug symbols by default.
    buildPhase = ''
        zig cc main.c -o ${gameName} -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
    '';

    installPhase = ''
        mkdir -p $out/bin
        cp ${gameName} $out/bin
    '';
}
