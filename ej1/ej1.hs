-- Universos (Equivalente a tener hechos individuales en la BD)
todosLosAnimales :: [String]
todosLosAnimales = ["Leon", "Zebra", "Gacela", "Raton", "Zorro"]

todosLosBiomas :: [String]
todosLosBiomas = ["Sabana", "Bosque"]

-- Hechos habita/2
habita :: String -> String -> Bool
habita animal bioma = (animal, bioma) `elem` [("Leon", "Sabana"), ("Zebra", "Sabana"), ("Gacela", "Sabana"), ("Raton", "Bosque")]

-- Hechos come/2
come :: String -> String -> Bool
come comedor comido = (comedor, comido) `elem` [("Leon", "Zebra"), ("Leon", "Gacela"), ("Zorro", "Raton")]

hostil :: String -> String -> Bool
hostil animal bioma = 
    animal `elem` todosLosAnimales && 
    bioma `elem` todosLosBiomas && -- Validación de que el bioma existe
    all (\otroAnimal -> come otroAnimal animal) habitantes del bioma
  where
    habitantesDelBioma = filter (\otro -> habita otro bioma) todosLosAnimales

terrible :: String -> String -> Bool
terrible animal bioma = 
    animal `elem` todosLosAnimales && 
    bioma `elem` todosLosBiomas &&
    all (\otroAnimal -> habita otroAnimal bioma) depredadores
  where
    depredadores = filter (\otro -> come otro animal) todosLosAnimales

compatibles :: String -> String -> Bool
compatibles unAnimal otroAnimal = 
    unAnimal `elem` todosLosAnimales && 
    otroAnimal `elem` todosLosAnimales &&
    not (come unAnimal otroAnimal) && 
    not (come otroAnimal unAnimal)

adaptable :: String -> Bool
adaptable animal = 
    animal `elem` todosLosAnimales &&
    all (\bioma -> habita animal bioma) todosLosBiomas

raro :: String -> Bool
raro animal = any (\bioma -> habita animal bioma && noHabitaEnOtros bioma) todosLosBiomas
  where
    noHabitaEnOtros bioma = all (\otroBioma -> otroBioma == bioma || not (habita animal otroBioma)) todosLosBiomas

dominante :: String -> Bool
dominante animal = any (\bioma -> habita animal bioma && esDominanteEn bioma) todosLosBiomas
  where
    esDominanteEn bioma = all (\otro -> otro == animal || come animal otro) habitantesDelBioma
      where 
        habitantesDelBioma = filter (\o -> habita o bioma) todosLosAnimales
