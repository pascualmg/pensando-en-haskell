module Exercises.Tema01.Ej02.SumaEurosColeccionMonedasSpec where

import Test.Hspec
import qualified Exercises.Tema01.Ej02.SumaEurosColeccionMonedas as SUT

-- | 1.2. Suma de euros de una colección de monedas
-- Ejercicio 1.2.1. Definir la función sumaMonedas tal que (sumaMonedas a b c d e) es la
-- suma de los euros correspondientes a a monedas de 1 euro, b de 2 euros, c de 5 euros, d 10 euros
-- y e de 20 euros. Por ejemplo,
-- sumaMonedas 0 0 0 0 1 == 20
-- sumaMonedas 0 0 8 0 3 == 100
-- sumaMonedas 1 1 1 1 1 == 38
spec :: Spec
spec = do 
  describe "Exercises.Tema01.Ej02.SumaEurosColeccionMonedasSpec" $ do
    it "Given 0 0 0 0 1 When sumaMonedas Then get 20 Euros" $ do
      SUT.sumaMonedas 0 0 0 0 1 `shouldBe` 20
    it "Given 0 0 8 0 3 When sumaMonedas Then get 20 Euros" $ do
      SUT.sumaMonedas 0 0 8 0 3 `shouldBe` 100
    it "given 1 1 1 1 1 When sumaMonedas Then get 38" $ do 
      SUT.sumaMonedas 1 1 1 1 1 `shouldBe` 38

