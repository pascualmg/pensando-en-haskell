module Exercises.Tema01.Ej01.MediaDeTresNumerosSpec where

import Test.Hspec
import qualified Exercises.Tema01.Ej01.MediaDeTresNumeros as SUT 

spec :: Spec
spec = do
  describe "Media de 3 números" $ do 
    it "Dados 3 numeros válidos Cuando aplico a media 3 Entonces obtengo su media" $ do
      SUT.media3 1 2 3 `shouldBe` 2
      
  describe "Media de una lista" $ do
    it "Dados una lista de numeros válidos Cuando aplico a media lista Entonces obtengo su media" $ do
      SUT.average' [1..100] `shouldBe` 50.5
