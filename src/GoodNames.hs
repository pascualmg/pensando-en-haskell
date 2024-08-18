module GoodNames where
  goodNames :: [[Char]]
  goodNames = [[c1,c2,c3,c4] | c1 <- consonantes , c2 <- vocales , c3 <- consonantes, c4 <- vocales ]
    where consonantes = ['a'..'z'] 
          vocales = "aeiou"

