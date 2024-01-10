{
  description = "jk-ece210";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        python = pkgs.python312;

      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.texliveFull
            pkgs.nixpkgs-fmt
            python
          ];
        };
      }
    );
}
