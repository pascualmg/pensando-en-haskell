module Exercises.Tema01.EJ03.SphereVolumeSpec where

import Test.Hspec
import qualified Exercises.Tema01.EJ03.SphereVolume as SUT


spec :: Spec
spec = do
  describe "SphereVolume" $ do 
    it "Given a radius of 10, the volume of the sphere is 4/3 * pi * r^3" $ do
      SUT.sphereVolume 10 `shouldBe` 4188.790204786391
    
  