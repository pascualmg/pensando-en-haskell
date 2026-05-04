{
  description = "Entorno de desarrollo Haskell para pensando-en-haskell (2025) - GHC 9.14 + hdb (DAP)";

  inputs = {
    # nixos-unstable necesario para GHC 9.14 (hdb DAP debugger requiere 9.14+)
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # Compilador GHC 9.14 binario directo (precompilado en cache.nixos.org).
        # Evita el set haskell.packages.ghc914 cuyas libs aun no estan
        # todas precompiladas y romperia el shell. cabal-install resolvera
        # las dependencias del proyecto contra Hackage usando este GHC.
        ghc914 = pkgs.haskell.compiler.ghc914;

      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            ghc914
            pkgs.cabal-install # cabal default, compatible con cualquier GHC
          ] ++ (with pkgs.haskellPackages; [
            # Tooling: binarios standalone del set haskellPackages default.
            # Funcionan sobre cualquier codigo Haskell, no requieren matchear GHC.
            ormolu
            fourmolu
            hlint
            ghcid
            hoogle
            implicit-hie
            cabal-fmt
          ]) ++ (with pkgs; [
            haskell-language-server # wrapper detecta GHC del proyecto
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
            echo "  • ghc        - Compilador Haskell 9.14"
            echo "  • cabal      - Build tool"
            echo "  • hls        - Haskell Language Server"
            echo "  • ghcid      - Recompilación ultra-rápida"
            echo "  • fourmolu   - Formateador"
            echo "  • hlint      - Linter"
            echo "  • hoogle     - Búsqueda de docs"
            echo ""
            echo "🐛 Debugger (primera vez):"
            echo "  cabal update"
            echo "  cabal install haskell-debugger --installdir=\$HOME/.local/bin"
            echo "  → \$HOME/.local/bin/hdb (configura dap-haskell en Doom)"
            echo ""
            echo "🚀 Comandos útiles:"
            echo "  cabal build              # Construir proyecto"
            echo "  cabal test               # Ejecutar tests"
            echo "  cabal repl               # REPL interactivo"
            echo "  ghcid -c 'cabal repl'    # Auto-recompilación"
            echo ""
            echo "💡 Doom Emacs + direnv = HLS automatico"
            echo "═══════════════════════════════════════════════════════"
          '';
        };
      });
}