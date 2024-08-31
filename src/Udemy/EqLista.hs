module Udemy.EqLista where


eqlista :: Eq a => [a] -> Bool
eqlista [] = True
eqlista [x] = True
eqlista [x,y] = x == y
eqlista (x:y:xs) = x == y && eqlista xs

-- >>> eqlista $ take 20 $cycle  [1]
-- True
