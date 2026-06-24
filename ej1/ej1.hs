-- % # Adaptable/1: Se cumple para todos los animales que habitan en todos los biomas.
-- % # Raro/1: Se cumple para todos los animales que habitan en un único bioma.
type Bioma = String
type Nombre = String
data Animal = Animal
{
    nombre :: Nombre,
    depredadores :: [Nombre],
    bioma :: Bioma
}   deriving (Show, Eq)

-- % # Ejercicio 1:Dado el predicado come/2 que relaciona a un animal con otro al cual se come, modelar los siguientes predicados: 
seCome :: Animal -> Animal -> Bool
seCome unAnimal otroAnimal = elem (nombre unAnimal) (depredadores otroAnimal)

-- % # Hostil/1: Relaciona un animal con un bioma si todos los animales que lo habitan se lo comen. 
esHostil :: Animal -> Bioma -> [Animal] -> Bool
esHostil unAnimal unBioma animales = all(\depredador -> seCome depredador unAnimal) (filter (\animal-> unBioma == (bioma animal) animales)

-- % # Compatibles/2: Relaciona dos animales si ninguno de los dos se come al otro.
sonCompatibles :: Animal -> Animal -> Bool
sonCompatibles unAnimal otroAnimal = not(seCome unAnimal otroAnimal) && not(seCome otroAnimal unAnimal))