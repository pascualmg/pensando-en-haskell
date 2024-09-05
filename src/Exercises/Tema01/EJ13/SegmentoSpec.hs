{-# LANGUAGE ScopedTypeVariables #-}
module Exercises.Tema01.EJ13.SegmentoSpec where

 import Test.Hspec ( hspec, describe, it, shouldBe )
 import Test.Hspec.QuickCheck ()
 --import Data.List (isPrefixOf)
 import Exercises.Tema01.EJ13.Segmento (segmento)



 segmentoSpec :: IO ()
 segmentoSpec = hspec $ do
  describe "segmento" $ do
    it "retorna una sublista correcta para índices válidos" $ do
      segmento 1 4 [1..5] `shouldBe` [2,3,4]
      segmento 0 3 ['a'..'e'] `shouldBe` "abc"

    it "maneja correctamente el caso donde el inicio es igual al fin" $ do
      segmento 2 2 [1..5] `shouldBe` []

    it "retorna una lista vacía si el inicio es mayor que el fin" $ do
      segmento 3 1 [1..5] `shouldBe` []

    it "maneja correctamente índices fuera de rango" $ do
      segmento 5 10 [1..5] `shouldBe` []
      segmento (-2) 2 [1..5] `shouldBe` [1,2]

    it "funciona con listas vacías" $ do
      segmento 0 5 ([] :: [Int]) `shouldBe` []

    it "preserva la estructura de la lista para tipos más complejos" $ do
      segmento 1 3 [(1,'a'),(2,'b'),(3,'c'),(4,'d')] `shouldBe` [(2,'b'),(3,'c')]
