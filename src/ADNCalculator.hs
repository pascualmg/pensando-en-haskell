module ADNCalculator where

  adnChars :: String
  adnChars = "ATCG"

  countChars :: Eq a => a -> [a] -> Int
  countChars c xs = length [x | x <- xs, x == c]

  hasOnlyElements :: Eq a => [a] -> [a] -> Bool
  hasOnlyElements xs validChars = not (null xs)  && all (`elem` validChars) xs

  isValid :: String -> Bool
  isValid xs = hasOnlyElements xs adnChars
  
  nucleotids :: String -> [(Char,Int)]
  nucleotids xs = [(c, countChars c xs ) | c <- adnChars]

  countADN :: String -> [(Char,Int)]
  countADN xs = 
    if isValid xs
    then nucleotids xs 
    else error "Invalid ADN" 
