# This file is to easily install latex dependancies to compile localy
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    flake-utils,
    nixpkgs,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      tex = pkgs.texlive.combine {
        inherit
          (pkgs.texlive)
          babel
          babel-swedish
          hyphen-swedish
          float
          times
          tex-gyre
          enumitem
          pgf
          xkeyval
          booktabs
          fancyhdr
          scheme-basic
          dvisvgm
          xcolor
          wrapfig
          zref
          amsmath
          ulem
          hyperref
          capt-of
          latexmk
          ;
      };
    in {
      devShells.default = with pkgs;
        mkShell {
          packages = with pkgs; [pandoc watchexec tree-sitter tex tex-fmt];
          shellHook = ''
          '';
        };
    });
}
