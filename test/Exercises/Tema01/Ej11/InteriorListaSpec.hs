{-# LANGUAGE ScopedTypeVariables #-}
module Exercises.Tema01.Ej11.InteriorListaSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Property ((==>))

-- Asumimos que la función 'interior' está definida en este módulo
import Exercises.Tema01.Ej11.InteriorLista (interior)

spec :: Spec
spec = do
  describe "Función interior" $ do
    it "devuelve [2] para [1,2,3]" $
      interior [1,2,3] `shouldBe` [2]

    it "devuelve la lista vacía para listas con menos de 3 elementos" $ do
      interior [1,2] `shouldBe` []
      interior [1] `shouldBe` []

    it "devuelve la lista vacía para la lista vacía" $
      interior ([] :: [Int]) `shouldBe` []

    it "devuelve la lista correcta para listas más largas" $
      interior [1..5] `shouldBe` [2,3,4]

    it "funciona con cualquier tipo de elemento" $
      interior ["a","b","c","d"] `shouldBe` ["b","c"]

    it "preserva la estructura interna para listas anidadas" $
      interior [[1,2],[3,4],[5,6],[7,8]] `shouldBe` [[3,4],[5,6]]

    it "devuelve una lista con longitud 2 menos que la original (para listas de longitud >= 2)" $
      property $ \(xs :: [Int]) -> length xs >= 2 ==> length (interior xs) == length xs - 2

    it "devuelve una sublista de la lista original" $
      property $ \(xs :: [Int]) -> interior xs `isSubsequenceOf` xs

  where
    isSubsequenceOf :: Eq a => [a] -> [a] -> Bool
    isSubsequenceOf [] _ = True
    isSubsequenceOf _ [] = False
    isSubsequenceOf (x:xs) (y:ys)
      | x == y    = isSubsequenceOf xs ys
      | otherwise = isSubsequenceOf (x:xs) ys
