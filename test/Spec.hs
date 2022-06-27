
import Test.Hspec
import qualified PatternMatchingSpec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "PatternMatchingSpec" PatternMatchingSpec.spec