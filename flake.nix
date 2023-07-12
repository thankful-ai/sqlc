{
    description = "sqlc";
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs";
    };

    outputs = {self, nixpkgs}: {
      defaultPackage.aarch64-darwin =
        with import nixpkgs { system = "aarch64-darwin"; };

        stdenv.mkDerivation rec {
          name = "sqlc-${version}";

          version = "1.19.0";

          # https://nixos.wiki/wiki/Packaging/Binaries
          src = pkgs.fetchurl {
            url = "https://github.com/kyleconroy/sqlc/releases/download/v1.19.0/sqlc_1.19.0_darwin_arm64.tar.gz";
            sha256 = "1vq5s5xa6lcymacc01mhypwskyja6k1hqd3lv6frn5i92bs1437z";
          };

          sourceRoot = ".";

          installPhase = ''
            install -m755 -D sqlc $out/bin/sqlc
          '';
        };

      defaultPackage.x86_64-linux =
        with import nixpkgs { system = "x86_64-linux"; };

        stdenv.mkDerivation rec {
          name = "sqlc-${version}";

          version = "1.19.0";

          # https://nixos.wiki/wiki/Packaging/Binaries
          src = pkgs.fetchurl {
            url = "https://github.com/kyleconroy/sqlc/releases/download/v1.19.0/sqlc_1.19.0_linux_amd64.tar.gz";
            sha256 = "1ff7ys9p9bjw17dn83v0s55hqfpv2lh9nxdb738kf75w06rwfjrb";
          };

          sourceRoot = ".";

          installPhase = ''
            install -m755 -D sqlc $out/bin/sqlc
          '';
        };
    };
}
