
import Test.Hspec
import qualified PatternMatchingSpec
import qualified Exercises.Tema01.Ej01.MediaDeTresNumerosSpec as T01EJ01
import qualified Exercises.Tema01.Ej02.SumaEurosColeccionMonedasSpec as T01EJ02

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "PatternMatchingSpec" PatternMatchingSpec.spec
  describe "Media de tres números" T01EJ01.spec 
  describe "Suma de euros con monedas" T01EJ02.spec