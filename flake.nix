{
    description = "sqlc";
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs";
    };

    outputs = {self, nixpkgs}: {
      defaultPackage.x86_64-linux =
        with import nixpkgs { system = "x86_64-linux"; };

        stdenv.mkDerivation rec {
          name = "sqlc-${version}";

          version = "1.18.0";

          # https://nixos.wiki/wiki/Packaging/Binaries
          src = pkgs.fetchurl {
            url = "https://github.com/kyleconroy/sqlc/releases/download/v1.18.0/sqlc_1.18.0_linux_amd64.tar.gz";
            sha256 = "sha256-PPttgt7JvBWjf5g4hss9VerNMbrYU43IZEl8/1nRM8U=";
          };

          sourceRoot = ".";

          installPhase = ''
            install -m755 -D sqlc $out/bin/sqlc
          '';
        };
    };
}
