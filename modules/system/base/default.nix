{ myLib, ... }: 

{
  imports = myLib.scanPaths ./.;
}