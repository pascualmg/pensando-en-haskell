module GoodNames where
  goodNames :: [[Char]]
  goodNames = [[c1,c2,c3,c4] | c1 <- ['a'..'z'] , c2 <- "aeiou" , c3 <- ['a'..'z'] , c4 <- "aeiou" ]
