module Exercises.Tema01.Ej10.Palindromo (palindromo) where

palindromo :: (Eq a) => [a] -> Bool
palindromo xs = xs == reverse xs

-- >>> palindromo "maam"
-- True

pintaveces ::  IO ()
pintaveces  = mapM_ print $ ['a'..'z']


-- >>> pintaveces
