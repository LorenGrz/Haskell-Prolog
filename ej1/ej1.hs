-- % # Ejercicio 1:Dado el predicado come/2 que relaciona a un animal con otro al cual se come, modelar los siguientes predicados: 
-- % # Hostil/1: Relaciona un animal con un bioma si todos los animales que lo habitan se lo comen. 
-- % # Terrible/1: Relaciona un animal con un bioma si todos los animales que se lo comen habitan ahí.
-- % # Compatibles/2: Relaciona dos animales si ninguno de los dos se come al otro.
-- % # Adaptable/1: Se cumple para todos los animales que habitan en todos los biomas.
-- % # Raro/1: Se cumple para todos los animales que habitan en un único bioma.

animales :: [String]
animales = ["leon", "cebra", "jirafa", "hiena", "tigre", "mono", "elefante"]

biomas :: [String]
biomas = ["sabana", "selva", "desierto"]

relacionCome :: [(String, String)]
relacionCome = [("leon", "cebra"), ("leon", "jirafa"), ("leon", "hiena"), ("tigre", "mono"), ("tigre", "elefante")]

relacionHabita :: [(String, String)]
relacionHabita = [("leon", "sabana"), ("cebra", "sabana"), ("jirafa", "sabana"), ("hiena", "sabana"), 
("tigre", "selva"), ("mono", "selva"), ("elefante", "desierto")]

-- base de datos
habita :: String -> String -> Bool
habita animal bioma = (animal, bioma) `elem` relacionHabita

come :: String -> String -> Bool
come animal otroAnimal = (animal, otroAnimal) `elem` relacionCome

animalesQueHabitan :: String -> [String]
animalesQueHabitan bioma = [animal | animal <- animales, habita animal bioma]

hostil :: String -> String -> Bool
hostil animal bioma = all (come animal) (animalesQueHabitan bioma)

-- 1. Conseguimos los enemigos del bicho
depredadoresDe :: String -> [String]
depredadoresDe víctima = filter (\depredador -> come depredador víctima) animales

-- 2. Nos aseguramos de que un enemigo no tenga casa en otro lado
viveSoloEn :: String -> String -> Bool
viveSoloEn animal biomaActual = all (\b -> not (habita animal b)) (filter (/= biomaActual) biomas)

-- 3. Juntamos todo: ¿Todos sus enemigos están atrapados en este único bioma?
biomaTerrible :: String -> String -> Bool
biomaTerrible animal bioma = all (\depredador -> viveSoloEn depredador bioma) (depredadoresDe animal)

compatibles :: String -> String -> Bool
compatibles animal1 animal2 = not(come animal1 animal2) && not(come animal2 animal1)

adaptable :: String -> Bool
adaptable animal = all(\bioma -> habita animal bioma) biomas

animalHabitaEn :: String -> [String]
animalHabitaEn animal = filter(habita animal) biomas

raro :: String -> Bool
raro animal = length(animalHabitaEn animal) == 1 

-- % # Dominante/1: Se cumple para todos los animales que se comen a todos los otros animales del bioma en el que viven.
dominante :: String -> String -> Bool
dominante animal bioma = all(come animal) animalesQueHabitan(bioma)