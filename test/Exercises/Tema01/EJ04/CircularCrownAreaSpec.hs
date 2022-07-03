module Exercises.Tema01.EJ04.CircularCrownAreaSpec where

import qualified Exercises.Tema01.EJ04.CircularCrownArea as SUT
import Test.Hspec

-- areaDeCoronaCircular 1 2 == 9.42477796076938
-- areaDeCoronaCircular 2 5 == 65.97344572538566
-- areaDeCoronaCircular 3 5 == 50.26548245743669

spec :: Spec
spec = do
  describe "CircularCrownArea" $ do
    it "should return the area of a circular crown" $ do
      SUT.circularCrownArea 1 2 `shouldBe` 9.42477796076938
      SUT.circularCrownArea 2 5 `shouldBe` 65.97344572538566
      SUT.circularCrownArea 3 5 `shouldBe` 50.26548245743669
