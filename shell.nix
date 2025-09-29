{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.zlib
    pkgs.pre-commit
    pkgs.ffmpeg
    pkgs.rustup
    pkgs.pkg-config
  ];

  shellHook = ''
    export LIBZ_SYS_STATIC=1
  '';
}
