module ADNCalculator( tester) where
  sample :: String
  sample = "gattaca"

  adnChars :: String
  adnChars = "ATCG"

  countChars :: Eq a => a -> [a] -> Int
  countChars c xs = length [x | x <- xs, x == c]

  hasOnlyElements :: Eq a => [a] -> [a] -> Bool
  hasOnlyElements xs validChars = not (null xs)  && all (`elem` validChars) xs

  isValid :: String -> Bool
  isValid xs = hasOnlyElements xs adnChars

  tester :: String -> IO ()
  tester = do
    print $ isValid sample
    print $ isValid sample
