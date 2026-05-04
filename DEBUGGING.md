# Haskell Debugger (hdb) — guía rápida

Setup paso a paso para debuggear este proyecto con `hdb` (debugger DAP de
Well-Typed) desde Doom Emacs usando **dape**. Todo nace del bump del flake
a **GHC 9.14**.

## TL;DR

```bash
cd ~/src/pensando-en-haskell
nix develop                       # GHC 9.14.1, cabal 3.16.1
cabal update                      # primera vez
cabal install haskell-debugger \
   --installdir=$HOME/.local/bin  # te deja `hdb` en PATH

cabal build debug101              # compila el executable de ejercicios
```

Luego en Doom: abres `app/Debugging101.hs`, `M-x dape`, eliges
`haskell-hdb`. Listo.

## 1. Prerequisitos cumplidos

- [x] `flake.nix` con GHC 9.14 (compilador binario, evita rebuilds del set)
- [x] direnv autorizado (`.envrc` carga el shell automáticamente al `cd`)
- [x] Doom Emacs con `:tools (debugger +lsp) direnv` y `:lang (haskell +lsp +test)`
- [x] dape configurado en `~/.config/doom/config.el` con adaptador
      `haskell-hdb`
- [x] `~/.local/bin` en `$PATH` (NixOS lo incluye por defecto)

## 2. Entrar al entorno

Con direnv:

```bash
cd ~/src/pensando-en-haskell
# direnv carga el shell (primera vez: direnv allow)
ghc --numeric-version  # debe imprimir 9.14.1
cabal --numeric-version
```

## 3. Instalar `hdb` (una sola vez)

```bash
cabal update
cabal install haskell-debugger --installdir=$HOME/.local/bin
```

`hdb` no está como paquete Nix listo (su sub-paquete `view` está marcado
broken en nixpkgs). Lo instalamos vía cabal: lee Hackage, descarga
fuentes, lo compila contra tu GHC 9.14 y te deja el binario en
`~/.local/bin/hdb`.

Verifica:

```bash
hdb --version
```

## 4. Compilar el executable de ejercicios

```bash
cabal build debug101
```

El target `debug101` está en `pensando-en-haskell.cabal` y construye
`app/Debugging101.hs`, un módulo con tres ejercicios pedagógicos para
entender lazy evaluation con el debugger:

1. **`foldrLazyDemo`** — `foldr` lazy, ver thunks evaluarse parcialmente.
2. **`maybeChainDemo`** — propagación de `Nothing` en cadenas `Maybe`.
3. **`eitherChainDemo`** — mismo flujo con `Either DivisionError Int`.

## 5. Doom Emacs (ya configurado)

En `~/.config/doom/config.el` tienes este bloque dentro de
`(use-package! dape :config ...)`:

```elisp
(add-to-list 'dape-configs
             `(haskell-hdb
               modes (haskell-mode haskell-ts-mode haskell-cabal-mode)
               ensure (lambda (config)
                        (unless (executable-find "hdb")
                          (user-error
                           "hdb no encontrado. cabal install haskell-debugger ...")))
               command "hdb"
               command-args ()
               :type "haskell"
               :request "launch"
               :name "haskell-hdb"))
```

Si modificas el config: `~/.config/emacs/bin/doom sync` y reinicia Doom.

## 6. Sesión de debug típica

| Paso | Acción |
|------|--------|
| 1 | Abre `app/Debugging101.hs` en Doom |
| 2 | Pon breakpoint con `M-x dape-breakpoint-toggle` o `SPC c b` |
| 3 | `M-x dape` → elige `haskell-hdb` |
| 4 | El programa arranca, se detiene en tu breakpoint |
| 5 | Inspecciona `xs` (mostrará `<thunk>`) |
| 6 | F10 (next) → mira el panel de variables |
| 7 | Vuelve a inspeccionar `xs` (ya parcialmente evaluado) |

Comandos dape útiles (`M-x dape-...`):

| Comando | Qué hace |
|---------|----------|
| `dape` | Arrancar debug (te pregunta config) |
| `dape-breakpoint-toggle` | Pone/quita breakpoint en línea |
| `dape-next` | Step over (F10) |
| `dape-step-in` | Step in (F11) |
| `dape-step-out` | Step out (F12) |
| `dape-continue` | Continuar (F5) |
| `dape-quit` | Cerrar sesión |
| `dape-info` | Panel de variables/stack/breakpoints |
| `dape-repl` | REPL conectado al programa pausado |

Ver también `~/.config/doom/dape-howto-noobs.org` que tienes en tu Doom
config para más detalles del flujo dape.

## 7. La transición clave

Pon breakpoint en `let xs = primerosCincoParesAlCuadrado` dentro de
`foldrLazyDemo`. Antes de que se ejecute la línea siguiente,
inspecciona `xs`:

```
xs : <thunk>          ← Haskell aún no ha evaluado nada
```

Step over. Ahora `xs` se imprime. Vuelve a inspeccionar:

```
xs : [4, 16, 36, 64, 100]   ← evaluado
```

Esa transición `<thunk>` → valor concreto es lo que vas a ver mil veces
y entender Haskell mejor que cualquier libro.

## 8. Troubleshooting

**`hdb: command not found`**
- `cabal install haskell-debugger --installdir=$HOME/.local/bin`
- Comprueba `echo $PATH | tr ':' '\n' | grep local`

**`dape` no encuentra el ejecutable de tu programa**
- Asegúrate de haber hecho `cabal build debug101`.
- dape usará tu `.cabal` para encontrar el target. Si no, te preguntará.
- El binario está en `dist-newstyle/build/.../debug101/build/debug101/debug101`.

**HLS no arranca**
- Verifica `hie.yaml` (ya está).
- En Doom: `M-x lsp-workspace-restart`.

**hdb se queja de la versión de GHC**
- Tienes que estar dentro de `nix develop` (o que direnv haya cargado).
- `which ghc` debería apuntar a un path con `ghc-9.14.1`.

## 9. ¿Y IntelliJ?

A día de hoy (mayo 2026), el plugin Haskell de IntelliJ IDEA **no implementa
DAP**. hdb solo se enchufa a editores con cliente DAP: VSCode, vim/neovim,
Emacs (dap-mode o dape) y Helix.

Para este proyecto el camino claro es Doom Emacs con dape, que ya tenías
configurado. El extra es que en Doom la curva está alineada con la mente
funcional: REPL al lado, GHCi vivo, hoogle integrado.

## 10. Lecturas

- Repo `hdb`: <https://github.com/well-typed/haskell-debugger>
- Documentación: <https://well-typed.github.io/haskell-debugger/>
- Post nuestro: <https://pascualmg.dev/blog/ambrosio/haskell-por-fin-tiene-debugger-dap-el-fin-de-una-excusa-de-20-anos>
- Plan de estudio: ver `STUDY_PLAN.md` en este repo.
