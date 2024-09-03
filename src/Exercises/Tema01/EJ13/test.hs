import Test.Hspec
import Test.QuickCheck

-- Asumimos que la función segmento está definida en otro módulo
-- import TuModulo (segmento)

-- Definición de ejemplo de la función segmento (comentar si se importa de otro módulo)
segmento :: Int -> Int -> [a] -> [a]
segmento start end xs = take (end - start) (drop start xs)

main :: IO ()
main = hspec $ do
  describe "segmento" $ do
    it "retorna una sublista correcta para índices válidos" $ do
      segmento 1 4 [1..5] `shouldBe` [2,3,4]
      segmento 0 3 ['a'..'e'] `shouldBe` "abc"

    it "maneja correctamente el caso donde el inicio es igual al fin" $ do
      segmento 2 2 [1..5] `shouldBe` []

    it "retorna una lista vacía si el inicio es mayor que el fin" $ do
      segmento 3 1 [1..5] `shouldBe` []

    it "maneja correctamente índices fuera de rango" $ do
      segmento 5 10 [1..5] `shouldBe` []
      segmento (-2) 2 [1..5] `shouldBe` [1,2]

    it "funciona con listas vacías" $ do
      segmento 0 5 ([] :: [Int]) `shouldBe` []

    it "preserva la estructura de la lista para tipos más complejos" $ do
      segmento 1 3 [(1,'a'),(2,'b'),(3,'c'),(4,'d')] `shouldBe` [(2,'b'),(3,'c')]

    it "es equivalente a (take (end - start) . drop start) para índices válidos" $
      property $ \start end (xs :: [Int]) ->
        start >= 0 && end >= start ==>
          segmento start end xs == (take (end - start) . drop start) xs

    it "nunca retorna más elementos que los especificados" $
      property $ \start end (xs :: [Int]) ->
        length (segmento start end xs) <= max 0 (end - start)

    it "retorna una sublista que es un prefijo de (drop start xs)" $
      property $ \start end (xs :: [Int]) ->
        segmento start end xs `isPrefixOf` drop start xs
