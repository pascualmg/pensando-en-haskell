module PatternMatchingSpec where

import Test.Hspec
import Control.Exception (evaluate)
import PatternMatching as SUT

spec :: Spec 
spec =  do
  describe "PatternMatching.isZero" $ do
    it "returns True if the element is Number 0" $ do
      print $ isZero 0
      SUT.isZero 0 `shouldBe` True
    it "returns False if the element is Number 1" $ do
      SUT.isZero 1 `shouldBe` False
    it "throws an exception if used with an empty list" $ do
      evaluate (head []) `shouldThrow` anyException
    describe "PatternMatching.eval" $ do
      it "given two integers when eval with operation sum char '+' then return the sum of the two integers" $ do
        SUT.eval 1 '+' 1 `shouldBe` 2 
      it "given two integers when eval with operation sum char '-' then return the difference of the two integers" $ do
        SUT.eval 1 '-' 1 `shouldBe` 0
      it "given two integers when eval with operation sum char '*' then return the product of the two integers" $ do      
        SUT.eval 1 '*' 1 `shouldBe` 1
      it "given two integers when eval with invalid operation char invalid op then return 0 " $ do  
        SUT.eval 1 'z' 1 `shouldBe` 0
      it "given two integers 1 and 1  when eval with operation sum char '/' then return the quotient of the two integers" $ do
        SUT.eval 1 '/' 1 `shouldBe` 1
      it "given two integers 1 and 0  when eval with operation sum char '/' then throws exception" $ do
        evaluate (SUT.eval 1 '/' 0) `shouldThrow` anyException 
       
       
