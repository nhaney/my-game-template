# My game template

The goal of this repo is to have a quick start for game development using the current tools of
my choice in order to create new games quickly for things like game jams or just for fun.

## Current goals for the repo

* Small and fast desktop + WASM builds for games.
    * Want to have smaller binary sizes for WASM games especially.
* Games written in C or zig for low level control.
* Currently using [raylib](https://github.com/raysan5/raylib) library to take care of things like windowing/basic graphics/audio/etc.
* Mostly 2d games to start, but want to be able to move into 3d.
* Uses zig compiler and zig build system for building binaries.
* Uses nix to manage dependencies and create reproducible builds.

