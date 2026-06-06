-- Resolver un problema para una librería
-- Si es cierto que cierta persona escribió alguna obra, sin importar cual.
-- Si es cierto que cierta obra existe.
-- Resolver un problema para una librería
type Titulo = String
type Autor = String
data Obra = UnaObra {titulo:: Titulo, autores:: [Autor]}

-- Base de DATOS
todasLasObras::[Obra]
todasLasObras = [UnaObra “sandman” [“gaiman”], 
                UnaObra “socorro” [“ElsaBornemann”], 
                UnaObra “buenos presagios” [“gaiman”, “pratchett”]]

-- ¿Es cierto que alguien escribió una determinada obra?
alguienEscribio :: Titulo -> Bool
alguienEscribio unTitulo = any (\obra -> titulo obra == unTitulo) todasLasObras)
-- en caso de que se pueda tener una lista vacia de autores e igualmente exista la obra
alguienEscribio :: Titulo -> Bool
alguienEscribio unTitulo = any (\obra -> titulo obra == unTitulo && not (null (autores obra))) todasLasObras

-- ¿Quién o quienes escribieron una obra?
quienesEscribieron :: Obra -> [String]
quienesEscribieron obra = autores obra

-- ¿Qué obras escribió cierta persona?
queObrasEscribio :: Autor -> [Obra]
queObrasEscribio unAutor = filter(\obra-> any(\autor -> autor == unAutor) (autores obra) ) todasLasObras