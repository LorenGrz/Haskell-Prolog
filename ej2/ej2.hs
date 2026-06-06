-- # Teniendo un juego de cartas con superhéroes y para cada superhéroe se tiene información de sus poderes.
-- # Se pide extender las cartas para incluir tags y definir funciones para cambiarlos
-- # Dado un mazo de cartas:
-- # Corregir las cartas a las que pusieron 
-- # tag #alguien en lugar de #alien

data Carta = UnSuperheroe {
    nombre  :: String,
    poderes :: [String],
    tags    :: [String]
} deriving (Show, Eq)

-- Tu Base de Datos (el mazo de cartas inicial)
mazo :: [Carta]
mazo = [
    UnSuperheroe "Iron Man" ["Volar", "Disparar Láser", "Super Inteligencia"] ["vengador", "humano", "millonario"],
    UnSuperheroe "Thor" ["Controlar el Trueno", "Fuerza Sobrehumana", "Volar"] ["vengador", "dios", "gandul"],
    UnSuperheroe "Wolverine" ["Garras de Adamantium", "Regeneración"] ["mutante", "x-men", "solitario"],
    UnSuperheroe "Spider-Man" ["Sentido Arácnido", "Trepar Paredes", "Lanzar Telarañas"] ["vengador", "humano", "adolescente"],
    UnSuperheroe "Storm" ["Controlar el Clima", "Volar"] ["mutante", "x-men"]
  ]

-- Agrega un tag nuevo a una carta (sin repetir si ya lo tiene)
agregarTag :: String -> Carta -> Carta
agregarTag nuevoTag carta = carta { tags = nuevoTag : tags carta }

-- Saca un tag de una carta
removerTag :: String -> Carta -> Carta
removerTag tagAOmitir carta = carta { tags = filter (/= tagAOmitir) (tags carta) }

-- Limpia todos los tags de una carta dejándola vacía
limpiarTags :: Carta -> Carta
limpiarTags carta = carta { tags = [] }


-- # Obtener los nombres de las cartas que
-- #  comienzan con “bat”

import Data.List (inPrefixOf)

nombresConBat :: [Carta] -> [String]
nombresConBat unMazo = map nombre (filter (\carta -> "bat" `isPrefixOf` nombre carta)unMazo)

