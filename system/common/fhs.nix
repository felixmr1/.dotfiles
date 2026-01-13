{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.buildFHSEnv {
      name = "ml";
      targetPkgs = pkgs: with pkgs; [
        python3
        uv
        stdenv.cc.cc.lib
        glib
        glibc
      ];
      runScript = "bash";
    })
  ];
}
