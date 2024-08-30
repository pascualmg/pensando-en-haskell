module Exercises.Tema01.EJ10.PalindromoSpec where
import Test.Hspec (Spec, describe, it, shouldBe)
import Exercises.Tema01.Ej10.Palindromo (palindromo)


spec :: Spec
spec = do
  describe "Palindromo" $ do
    it "devuelve true si ese palindromo" $ do
      palindromo "abba" `shouldBe` True
    it "devuelve false si no es palindromo" $ do
      palindromo "nosoypalindromo" `shouldBe` False
