module AI.HasCallStack where
import GHC.Stack (HasCallStack)

primerElemento :: HasCallStack => [a] -> a
primerElemento [] = error "La lista está vacía!"
primerElemento (x:_) = x

main :: IO ()
main = do
    let lista1 = [1, 2, 3]
    let lista2 = []

    putStrLn "Primer elemento de lista1:"
    print (primerElemento lista1::Double)
    putStrLn "\nIntentando obtener el primer elemento de lista2 (vacía):"
    print (primerElemento lista2::Int)

-- >>> print $ primerElemento [1..2]
