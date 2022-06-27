module PatternMatchingSpec where

import Test.Hspec
import Control.Exception (evaluate)
import PatternMatching as SUT

spec :: Spec 
spec =  do
  describe "PatternMatching.isZero" $ do
    it "returns True if the element is Number 0" $ do
      print $ isZero 0
      SUT.isZero 0 `shouldBe` False
    it "returns False if the element is Number 1" $ do
      print $ isZero 1
      SUT.isZero 0 `shouldBe` False
    it "throws an exception if used with an empty list" $ do
      evaluate (head []) `shouldThrow` anyException
