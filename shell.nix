{ pkgs ? import <nixpkgs> { } }:
let
  goptimize = pkgs.buildGoModule {
    pname = "goptimize";
    version = "0.2.3";
    vendorHash = "sha256-UGbpPnvBcJKGLn/wMl/ypMrVO5C6xGmRzFw433027G8=";
    src = pkgs.fetchFromGitHub {
      owner = "axllent";
      repo = "goptimize";
      rev = "788c6ecf234ba3b1e71c4fe1cddd2ef8c0482bd1";
      hash = "sha256-oA1QN3Ob2aHBwwgaD5yEojtM4WA8TMU22v04Gx/XpVQ=";
    };
  };
in pkgs.mkShell { packages = with pkgs; [ goptimize ffmpeg git ]; }
