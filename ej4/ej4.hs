-- Ejercicio 1: Resolver un problema para una consultora
-- BD:
-- programaEn(maria, cobol).
-- programaEn(maria, java).
-- programaEn(mario, cobol).
-- programaEn(mario, python).
-- programaEn(jose, cobol).
-- programaEn(jorge,java).
-- programaEn(jorge,python).
type Nombre = String
type Lenguaje = String
data Persona = Persona
{
    nombre :: Nombre,
    lenguajes :: [Lenguaje]
}   deriving (Show, Eq)

-- ¿Es cierto que alguien programa en Cobol?
programaEn :: Lenguaje -> [Persona] -> Bool
programaEn lenguaje personas = elem lenguaje (concatMap lenguajes personas)
-- Tambien puede ser
programaEn lenguaje personas = any (\persona -> elem lenguaje (lenguajes persona)) personas

-- ¿Qué lenguajes maneja María?
queLenguajesManeja :: Persona -> [Lenguaje]
queLenguajesManeja persona = lenguajes persona

-- ¿Quién o quienes programan en Cobol?
quienProgramaEn :: Lenguaje -> [Persona] -> [Nombre]
quienProgramaEn lenguaje personas = map nombre (filter (\persona -> elem lenguaje (lenguajes persona)) personas)

-- ¿Maria y Mario son colegas?
sonColegas :: Persona -> Persona -> Bool
sonColegas unaPersona otraPersona = any (\lenguaje -> elem lenguaje (lenguajes unaPersona)) (lenguajes otraPersona)
