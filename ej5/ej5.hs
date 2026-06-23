-- Ejercicio 2: Se pide armar el árbol familiar Real Inglés, usando la relación “esHijoDe”
-- ¿Es cierto que Archie es primo del príncipe Jorge?
-- ¿Quienes son primos?
-- BD:
-- esHijoDe(carlosIII, isabelII).
-- esHijoDe(ana, isabelII).
-- esHijoDe(andrew, isabelII).
-- esHijoDe(edward, isabelII).
-- esHijoDe(henry, carlosII).
-- ……….
type Nombre = String

data Persona = Persona 
  { nombre :: Nombre
  , padres :: [Nombre] -- Lista con los nombres de sus padres
  } deriving (Show, Eq)

esHijoDe :: Persona -> Persona -> Bool
esHijoDe padre hijo = elem (nombre padre) (padres hijo)

-- ¿Es cierto que la reina Isabel tiene hijos?	
tieneHijos :: Persona -> [Persona] -> Bool
tieneHijos unaPersona personas = any (esHijoDe unaPersona) personas
-- Se puede usar lambda (\p -> esHijoDe persona p) pero se puede usar de la otra forma mas reducida

-- ¿Quién o quienes son hijos de la reina Isabel?
quienesSonHijos :: Persona -> [Persona] -> [Persona]
quienesSonHijos unaPersona personas = filter (esHijoDe unaPersona) personas

-- ¿Quiénes son los nietos del Carlos III?
quienesSonNietos :: Persona -> [Persona] -> [Persona]
quienesSonNietos abuelo personas = concatMap (\padre -> quienesSonHijos padre personas) (quienesSonHijos abuelo personas)
