module Exercises.MediaDeTresNumeros where
 media3 :: (Fractional a) => a -> a -> a -> a
 media3 a b c = (a + b + c) / 3 
 
 average' :: (Fractional a) => [a] -> a
 average' xs = sum xs / fromIntegral (length xs)

  

