{
  description = "neko.core";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs
            pnpm
            git
            cacert
            gnupg
          ];
          
          sandboxPaths = [ "/etc/ssl" "/tmp" ];
          
          shellHook = ''
            export PNPM_HOME="$(pwd)/.pnpm-store"
            export PNPM_STORE_DIR="$PNPM_HOME"
            mkdir -p $PNPM_HOME
            
            export PNPM_VERIFY_STORE_INTEGRITY=false
            export PNPM_STRICT_SSL=false
            export PNPM_IGNORE_WORKSPACE=true
            
            export COREPACK_ENABLE_STRICT=0
            export COREPACK_DOWNLOAD_MIRROR=https://npmmirror.com/mirrors/corepack/
            
            export SSL_CERT_FILE="${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
            export NODE_EXTRA_CA_CERTS="${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
            
            export npm_config_arch="x64"
          '';
        };
      }
    );
}