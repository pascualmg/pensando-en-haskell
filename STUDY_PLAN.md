# Plan de estudio Haskell — 8 semanas

Una hora a la semana, sin IA. Lunes 19h. Emacs Doom + GHC 9.14 + hdb.

## Filosofía

- **Sin IA durante la sesión.** Usar `:t`, `:i`, `:browse`, hoogle, libros.
- **Sesión sagrada de 60 minutos.** Si te quedas con un error, peleas con
  GHC. Esa pelea es donde aprendes.
- **Cada semana cierra con algo COMMITEADO en el repo.** Aunque sea un
  one-liner. La línea importa más que la perfección.

## Setup inicial (semana 0, hoy)

- [x] `flake.nix` bumpeado a GHC 9.14
- [x] `nix develop` valida `9.14.1` + `cabal 3.16`
- [ ] `cabal install haskell-debugger --installdir=$HOME/.local/bin`
- [ ] Verifica `hdb --version`
- [ ] `cabal build debug101` compila
- [ ] En Doom: abre `app/Debugging101.hs`, `M-x dape`, elige `haskell-hdb`
- [ ] Pon breakpoint, F5, ve un `<thunk>`

Si llegaste aquí, has pasado el escollo más difícil. El resto es práctica.

## Semana 1 — Reconectar con la lazy evaluation

**Objetivo**: ver thunks evaluarse en vivo.

- [ ] Abre `app/Debugging101.hs`, breakpoint en `let xs = primerosCincoParesAlCuadrado`.
- [ ] `M-x dape` → `haskell-hdb`. Step over (F10) hasta `print`.
- [ ] Inspecciona `xs` antes y después. Anota lo que ves.
- [ ] Cambia `take 5` a `take 1000`. ¿Cuántos elementos se evalúan? Mira el panel.
- [ ] Repite con `take 0`. ¿Qué pasa?

**Cierre**: commitea un micro-archivo `notes/sem01-lazy.md` con tres
observaciones tuyas. Sin pasarte. Tres bullets.

## Semana 2 — Maybe en cadena

**Objetivo**: entender por qué `Just`/`Nothing` se propaga sin `if`.

- [ ] Breakpoint dentro de `calculoSeguro`, en `x <- safeDivide a b`.
- [ ] Llamas `maybeChainDemo`. Step in (F11) en cada paso.
- [ ] Observa qué pasa cuando `b=0` vs `b=1`.
- [ ] **Ejercicio escrito**: añade `safeLog :: Int -> Maybe Double` en
  `Debugging101.hs` que falle con `n <= 0`. Encadénalo después del `safeSqrt`.

**Cierre**: commit de `safeLog` + un breakpoint visual probado.

## Semana 3 — Either: el error que te dice qué pasó

**Objetivo**: reemplazar `Maybe` por `Either DivisionError Int` y ver
diferencia en el panel del debugger.

- [ ] Mismo flujo pero con `calculoSeguroE`.
- [ ] Inspecciona el `Left`: ves la variante exacta (`DividedByZero` vs
  `NegativeBeforeSqrt 25`).
- [ ] **Ejercicio**: extiende `DivisionError` con `LogOfNonPositive Int` y
  el caso lo tira `safeLogE`.

**Cierre**: commit del nuevo error tipado.

## Semana 4 — Pattern matching y `case`

**Objetivo**: ver el flujo de pattern matching paso a paso.

- [ ] Lee `src/PatternMatching.hs` (ya lo tienes).
- [ ] Pon breakpoints en cada brazo del `case`.
- [ ] Llama desde `cabal repl`: `> :load Debugging101` y ejecuta funciones.
- [ ] **Ejercicio**: escribe `describirNumero :: Int -> String` con
  pattern matching para 0, negativo, par, impar.

**Cierre**: commit en `src/Exercises/Tema02/Ej01/DescribirNumero.hs` (creas
Tema02 si no existe).

## Semana 5 — Listas y recursión

**Objetivo**: depurar funciones recursivas. Ver el call stack en hdb.

- [ ] Implementa `miReverse :: [a] -> [a]` recursivo.
- [ ] Implementa `miMap :: (a -> b) -> [a] -> [b]` recursivo.
- [ ] Breakpoint en cada llamada recursiva. Avanza con F10.
- [ ] Observa la pila de llamadas (`Stack` panel en dape).
- [ ] **Reto**: implementa `quicksort` ingenuo. Depúralo con una lista
  pequeña. Mira cómo se reconstruye la lista al final.

**Cierre**: commit de las tres funciones en `src/Exercises/Tema02/Listas/`.

## Semana 6 — Typeclasses propias

**Objetivo**: definir tu primera typeclass y ver instances en runtime.

- [ ] Define `class Describable a where describe :: a -> String`.
- [ ] Da instancias para `Int`, `String`, `Maybe a` (con constraint
  `Describable a`).
- [ ] Llama `describe` con distintos tipos en `cabal repl`.
- [ ] Breakpoint dentro de cada `instance`. Confirma cuál se ejecuta.

**Cierre**: commit en `src/Describable.hs`.

## Semana 7 — Mónada propia

**Objetivo**: la fábula de las mónadas, vista desde el debugger.

- [ ] Define `data Logged a = Logged { val :: a, logs :: [String] }`.
- [ ] Implementa `Functor`, `Applicative`, `Monad` para `Logged`.
- [ ] Escribe una función con `do`-notation que use `Logged Int`.
- [ ] Breakpoint en cada `>>=` y observa cómo se acumulan logs.

**Cierre**: post de blog tuyo (no mío) explicando qué entendiste.
1000 palabras max.

## Semana 8 — Servidor web mínimo

**Objetivo**: usar lo aprendido para escribir un endpoint Scotty.

- [ ] Añade dep `scotty` al `.cabal`.
- [ ] Crea `app/Server.hs` con `GET /hello -> "world"`.
- [ ] Breakpoint dentro del handler, ve qué llega.
- [ ] **Reto**: endpoint `GET /pares/:n` que devuelve los primeros n
  pares. Reusa `primerosCincoParesAlCuadrado` adaptado.

**Cierre**: post tuyo "Mi primer endpoint Haskell con debugger".
Enlazas al [post del hito](https://pascualmg.dev/blog/ambrosio/haskell-por-fin-tiene-debugger-dap-el-fin-de-una-excusa-de-20-anos)
de Ambrosio.

## Después

- Lectura: "Domain Modeling Made Functional" (Wlaschin, F# pero idéntico
  espíritu).
- Reto: portar **un** controller mínimo de Cohete a Servant en una rama
  experimental tuya.
- Hito personal: cuando puedas leer un programa Haskell y predecir el
  comportamiento por su tipo sin ejecutarlo, ya estás dentro.

## Reglas

1. **Sin IA en la hora sagrada**. Después puedes preguntar lo que quieras.
2. **Una hora exacta**. Si no terminas, anotas dónde quedaste y vuelves
   la semana siguiente.
3. **Un commit mínimo por semana**. Aunque sea `notes/semN.md` con tres
   bullets.
4. **El debugger siempre encendido**. Es la herramienta nueva, exprímela.

## Recursos

- "Effective Haskell" (Skinner, 2024) — moderno, GHC2021.
- "Haskell Programming from First Principles" (Allen, Moronuki) — clásico.
- Hoogle: `M-x hoogle` desde Doom.
- Repo del libro de Alonso: `pensando-en-haskell` (este).
- Mi post NixOS-noobs: <https://pascualmg.dev/blog/ambrosio/nixos-explicado-para-gente-que-ha-tocado-un-terminal-alguna-vez>
- Mi post Haskell-IA: <https://pascualmg.dev/blog/ambrosio/haskell-en-la-era-de-la-ia-por-que-ahora-mas-que-nunca>
