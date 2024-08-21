module Exercises.Tema01.EJ08.RotaListaSpec where
import qualified Exercises.Tema01.EJ08.RotaLista as SUT
import Test.Hspec (describe, it, shouldBe, Spec)

spec :: Spec
spec = do
  describe "Rotalista" $ do
    it "rota1 rota la primera posicionn al final" $ do
      SUT.rota1 "8==D" `shouldBe` "==D8"
