
import Test.Hspec
import qualified PatternMatchingSpec
import qualified Exercises.MediaDeTresNumerosSpec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "PatternMatchingSpec" PatternMatchingSpec.spec
  describe "Exercises.MediaDeTresNumeros" Exercises.MediaDeTresNumerosSpec.spec