{
  description = "jk-ece210";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs:

    inputs.flake-utils.lib.eachDefaultSystem (
      system:

      let
        pkgs = import inputs.nixpkgs {
          inherit system;
        };

        inherit (pkgs) lib;
        inherit (pkgs) texlive;

        texlive-pkgs = texlive.withPackages (
          ps: with ps; [
            amsmath
            bookmark
            booktabs
            caption
            csquotes
            emoji
            enumitem
            epstopdf-pkg
            etoolbox
            fancyhdr
            fontawesome
            fontspec
            geometry
            hyperref
            ifmtarg
            latex-bin
            lineno
            listings
            lualatex-math
            marginnote
            mathtools
            minted
            parskip
            pgf
            ragged2e
            siunitx
            tikz-among-us
            titling
            tools
            unicode-math
            upquote
            wrapfig
            xifthen
            xurl
          ]
        );

      in
      {
        devShells.default = pkgs.mkShellNoCC (
          let
            pre-commit-bin = "${lib.getBin pkgs.pre-commit}/bin/pre-commit";

          in
          {
            packages = with pkgs; [
              black
              mdformat
              pre-commit
              ruff
              scons
              shfmt
              texlive-pkgs
              toml-sort
              treefmt2
              yamlfmt
              yamllint
            ];

            shellHook = ''
              ${pre-commit-bin} install --allow-missing-config > /dev/null
            '';
          }
        );

        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
