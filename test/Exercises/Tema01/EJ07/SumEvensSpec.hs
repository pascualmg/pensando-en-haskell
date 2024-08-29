  module Exercises.Tema01.EJ07.SumEvensSpec where

import Exercises.Tema01.EJ07.MiXor (xor1, xor2, xor3, xor4)
import qualified Exercises.Tema01.EJ07.SumEvens as SUT
import Test.Hspec (Spec, describe, it, shouldBe)



spec :: Spec
spec = do
  describe "sumEvens" $ do
    it "returns 0 for an empty list" $ do
      SUT.sumEvens [] `shouldBe` 0
    it "returns the only element for a single element list" $ do
      SUT.sumEvens [2] `shouldBe` 2
    it "returns the sum of the even elements for a two elements list" $ do
      SUT.sumEvens [2, 4] `shouldBe` 6
    it "returns the sum of the even elements for a three elements list" $ do
      SUT.sumEvens [1, 2, 3] `shouldBe` 2

  describe "sumEvens'" $ do
    it "returns 0 for an empty list" $ do
      SUT.sumEvens' [] `shouldBe` 0
    it "returns the only element for a single element list" $ do
      SUT.sumEvens' [2] `shouldBe` 2
    it "returns the sum of the even elements for a two elements list" $ do
      SUT.sumEvens' [2, 4] `shouldBe` 6
    it "returns the sum of the even elements for a three elements list" $ do
      SUT.sumEvens' [1, 2, 3] `shouldBe` 2

  describe "sumEvens''" $ do
    it "returns 0 for an empty list" $ do
      SUT.sumEvens'' [] `shouldBe` 0
    it "returns the only element for a single element list" $ do
      SUT.sumEvens'' [2] `shouldBe` 2
    it "returns the sum of the even elements for a two elements list" $ do
      SUT.sumEvens'' [2, 4] `shouldBe` 6
    it "returns the sum of the even elements for a three elements list" $ do
      SUT.sumEvens'' [1, 2, 3] `shouldBe` 2



  describe "xors" $ do
    it "xor1" $ do
      xor1 True True `shouldBe` False
      xor1 False False `shouldBe` False
      xor1 False True `shouldBe` True
      xor1 True False `shouldBe` True

    it "xor2" $ do
      xor2 True True `shouldBe` False
      xor2 False False `shouldBe` False
      xor2 False True `shouldBe` True
      xor2 True False `shouldBe` True

    it "xor3" $ do
      xor3 True True `shouldBe` False
      xor3 False False `shouldBe` False
      xor3 False True `shouldBe` True
      xor3 True False `shouldBe` True

    it "xor4" $ do
      xor4 True True `shouldBe` False
      xor4 False False `shouldBe` False
      xor4 False True `shouldBe` True
      xor4 True False `shouldBe` True
