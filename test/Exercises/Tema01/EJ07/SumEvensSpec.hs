module Exercises.Tema01.EJ07.SumEvensSpec where
import qualified Exercises.Tema01.EJ07.SumEvens as SUT
import Test.Hspec ( describe, it, shouldBe, Spec )

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
