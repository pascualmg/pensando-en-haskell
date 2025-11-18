{
  description = "Entorno de desarrollo Haskell para pensando-en-haskell (2025) - Enfoque Minimalista";

  inputs = {
    # Usar 25.05 (stable) que tiene HLS compatible con GHC 9.8.4
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # GHC 9.8 para coincidir con stack.yaml
        ghcVersion = "ghc98";
        hsPkgs = pkgs.haskell.packages.${ghcVersion};

      in
      {
        devShells.default = pkgs.mkShell {
          # Paquetes del proyecto - SOLO binarios pre-compilados
          packages = with hsPkgs; [
            # Core toolchain
            ghc
            cabal-install

            # Formatters (binarios estables)
            ormolu
            fourmolu

            # Linting
            hlint

            # Development tools
            ghcid
            hoogle

            # Utilidades
            implicit-hie
            cabal-fmt

          ] ++ (with pkgs; [
            # HLS - Incluye wrapper + binarios pre-compilados
            # El wrapper detecta automáticamente la versión de GHC del proyecto
            haskell-language-server

            # System dependencies
            zlib
            gmp
            pkg-config
          ]);

          # Variables de entorno
          shellHook = ''
            echo "═══════════════════════════════════════════════════════"
            echo "🎓 Entorno Haskell - Pensando en Haskell"
            echo "═══════════════════════════════════════════════════════"
            echo "GHC:          $(ghc --numeric-version)"
            echo "Cabal:        $(cabal --numeric-version)"
            echo ""
            echo "📦 Herramientas disponibles:"
            echo "  • ghc        - Compilador Haskell 9.8.4"
            echo "  • cabal      - Build tool"
            echo "  • hls        - Haskell Language Server (IDE support)"
            echo "  • ghcid      - Recompilación ultra-rápida"
            echo "  • fourmolu   - Formateador (recomendado)"
            echo "  • ormolu     - Formateador alternativo"
            echo "  • hlint      - Linter"
            echo "  • hoogle     - Búsqueda de docs"
            echo "  • gen-hie    - Genera hie.yaml"
            echo ""
            echo "🚀 Comandos útiles:"
            echo "  cabal build              # Construir proyecto"
            echo "  cabal test               # Ejecutar tests"
            echo "  cabal repl               # REPL interactivo"
            echo "  ghcid -c 'cabal repl'    # Auto-recompilación"
            echo "  fourmolu -i src/**/*.hs  # Formatear código"
            echo ""
            echo "💡 Doom Emacs + direnv = HLS funciona automáticamente"
            echo "═══════════════════════════════════════════════════════"
          '';
        };
      });
}