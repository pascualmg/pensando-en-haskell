module LetInExample where

-- | https://youtu.be/6MsQcUprO9o?t=2829 
letInExample :: Integer
letInExample =
  let a = 1
      b = 2
      c =
        let d = 3
            e = 4
         in d + e
   in a + b + c
