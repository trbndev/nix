{ lib, ... }:

{
  # Path Utilities
  scanPaths = path:
    let
      dirContents = builtins.readDir path;
      filtered = lib.attrsets.filterAttrs
        (path: _type:
          (_type == "directory")
          || ((path != "default.nix") && (lib.strings.hasSuffix ".nix" path)))
        dirContents;
    in
    builtins.trace "Filtered contents: ${builtins.toJSON filtered}" (
      builtins.map (f: (path + "/${f}")) (builtins.attrNames filtered)
    );
}
