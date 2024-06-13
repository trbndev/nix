let
  lib = import <nixpkgs/lib>;
  scanPathsModule = import ./../utils/path.nix { inherit lib; };
in
  scanPathsModule.scanPaths ./.
