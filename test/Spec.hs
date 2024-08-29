
import Test.Hspec
import qualified PatternMatchingSpec
import qualified Exercises.Tema01.Ej01.MediaDeTresNumerosSpec as T01EJ01
import qualified Exercises.Tema01.Ej02.SumaEurosColeccionMonedasSpec as T01EJ02
import qualified Exercises.Tema01.EJ03.SphereVolumeSpec as T01EJ03
import qualified Exercises.Tema01.EJ04.CircularCrownAreaSpec as T01EJ04
import qualified Exercises.Tema01.EJ07.SumEvensSpec as T01EJ07
import qualified Exercises.Tema01.EJ08.RotaListaSpec as T01EJ08
import qualified Exercises.Tema01.EJ10.PalindromoSpec as T01EJ10

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "PatternMatchingSpec" PatternMatchingSpec.spec
  describe "Media de tres números" T01EJ01.spec 
  describe "Suma de euros con monedas" T01EJ02.spec
  describe "Volúmen de la esfera" T01EJ03.spec
  describe "Áread e una corona circular" T01EJ04.spec
  describe "suma pares" T01EJ07.spec
  describe "RotaLista" T01EJ08.spec
  describe "palindromo" T01EJ10.spec
