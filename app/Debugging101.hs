{- |
Module      : Debugging101
Description : Ejercicios pedagogicos para usar hdb (DAP debugger).

COMO USAR:
  1. cabal build pensando-en-haskell-debug101
  2. En Doom Emacs: abre este fichero, F9 sobre la linea que quieras
     detener, luego SPC d d para arrancar el debugger.
  3. F10 (step over), F11 (step in), F12 (step out).
  4. Inspecciona variables en el panel de DAP.

Tres ejercicios disenados para ENTENDER lazy evaluation de Haskell:

  * 'foldrLazyDemo'  - como un thunk se evalua de izquierda a derecha
  * 'maybeChainDemo' - como Just/Nothing se propagan
  * 'eitherChainDemo' - mismo problema que Maybe pero con error tipado

La gracia esta en mirar el panel de variables CADA VEZ que avanzas:
veras valores convertirse de "<thunk>" a su forma concreta.
-}
module Main where

import Data.Maybe (fromMaybe)

-- =============================================================================
-- 1. FOLDR + LAZY EVALUATION
-- =============================================================================
-- foldr es perezoso: NO evalua toda la lista de golpe.
-- En este ejemplo creamos una lista [1..1000000] y solo extraemos los
-- primeros 5 elementos pares al cuadrado. Una version imperativa
-- consumiria 1 millon de elementos. Haskell solo evalua los necesarios.

primerosCincoParesAlCuadrado :: [Int]
primerosCincoParesAlCuadrado =
  take 5 $
    map (^ (2 :: Int)) $
      filter even [1 .. 1000000]

-- Con breakpoint en cada linea de abajo y stepping, veras:
--   xs ANTES de evaluar: <thunk>
--   xs DESPUES: lista parcial, solo lo necesario
foldrLazyDemo :: IO ()
foldrLazyDemo = do
  putStrLn "=== foldrLazyDemo ==="
  let xs = primerosCincoParesAlCuadrado
  putStrLn $ "Resultado esperado: " ++ show xs
  putStrLn "(con el debugger, observa xs como <thunk> antes del print)"

-- =============================================================================
-- 2. MAYBE CHAIN
-- =============================================================================
-- Maybe es la forma idiomatica de manejar fallos en Haskell.
-- Cada operacion devuelve Just x o Nothing. El operador >>= propaga
-- el fallo: si UN paso da Nothing, el resto se salta automaticamente.

safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide a b = Just (a `div` b)

safeSqrt :: Int -> Maybe Int
safeSqrt n
  | n < 0 = Nothing
  | otherwise = Just (round (sqrt (fromIntegral n) :: Double))

-- Cadena que puede fallar en cualquier punto:
-- 1. dividir a entre b
-- 2. sumar 10 al resultado
-- 3. raiz cuadrada
calculoSeguro :: Int -> Int -> Maybe Int
calculoSeguro a b = do
  x <- safeDivide a b -- Nothing si b=0
  let y = x + 10
  safeSqrt y -- Nothing si y<0

-- Pon breakpoint dentro de calculoSeguro (linea del do).
-- Llama maybeChainDemo y observa como avanza paso a paso.
-- Prueba con (10, 2): exito. Con (10, 0): falla en safeDivide.
-- Con (-50, 1): falla en safeSqrt.
maybeChainDemo :: IO ()
maybeChainDemo = do
  putStrLn "=== maybeChainDemo ==="
  let casos =
        [ (10, 2)
        , (10, 0) -- division por 0 -> Nothing
        , (-50, 1) -- raiz negativa -> Nothing
        , (16, 1) -- (16/1)+10 = 26, sqrt 26 = 5
        ]
  mapM_
    ( \(a, b) ->
        putStrLn $
          "calculoSeguro " ++ show a ++ " " ++ show b ++ " = " ++ show (calculoSeguro a b)
    )
    casos

-- =============================================================================
-- 3. EITHER CHAIN (mismo problema con error tipado)
-- =============================================================================
-- Either es como Maybe pero el "fallo" lleva informacion.
-- Aqui DivisionError describe que tipo de error ocurrio.

data DivisionError
  = DividedByZero
  | NegativeBeforeSqrt Int
  deriving (Show)

safeDivideE :: Int -> Int -> Either DivisionError Int
safeDivideE _ 0 = Left DividedByZero
safeDivideE a b = Right (a `div` b)

safeSqrtE :: Int -> Either DivisionError Int
safeSqrtE n
  | n < 0 = Left (NegativeBeforeSqrt n)
  | otherwise = Right (round (sqrt (fromIntegral n) :: Double))

-- Mismo flujo que el Maybe pero ahora si falla SABEMOS por que.
calculoSeguroE :: Int -> Int -> Either DivisionError Int
calculoSeguroE a b = do
  x <- safeDivideE a b
  let y = x + 10
  safeSqrtE y

eitherChainDemo :: IO ()
eitherChainDemo = do
  putStrLn "=== eitherChainDemo ==="
  let casos = [(10, 2), (10, 0), (-50, 1), (16, 1)]
  mapM_
    ( \(a, b) ->
        putStrLn $
          "calculoSeguroE " ++ show a ++ " " ++ show b ++ " = " ++ show (calculoSeguroE a b)
    )
    casos

-- =============================================================================
-- BONUS: thunk visible cuando NO se fuerza
-- =============================================================================
-- 'unevaluated' construye una expresion CARA pero nunca la fuerza.
-- En el debugger lo veras como <thunk>. Si descomentas el print, se evalua.
unevaluated :: Int
unevaluated = sum [1 .. 1000000] -- caro!

main :: IO ()
main = do
  foldrLazyDemo
  putStrLn ""
  maybeChainDemo
  putStrLn ""
  eitherChainDemo
  putStrLn ""

  -- DESCOMENTA esta linea cuando quieras ver el thunk evaluarse:
  -- print unevaluated

  putStrLn "Fin."

-- helper local (no usado, ejemplo para alumnos)
_localExample :: Maybe Int -> Int
_localExample = fromMaybe 0
