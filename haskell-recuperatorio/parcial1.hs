-- Enunciado modelado
-- Se quiere responder consultas del estilo:
-- 1. ¿Es cierto que un doctor atendió a un paciente determinado?
-- 2. ¿Quién o quiénes atendieron a un paciente?
-- 3. ¿Qué paciente fue curado/atendido por cierto doctor?
-- 4. ¿Es cierto que cierto doctor atendió a algún paciente, sin importar cuál?
-- 5. ¿Es cierto que cierto paciente existe?
-- Como el enunciado muestra Paciente, Doctor, Diagnostico y un Turno, modelamos cada
-- atención como un turno.
type Paciente = String
type Doctor = String
type Diagnostico = String
data Turno = UnTurno {
    paciente :: Paciente,
    doctores :: [Doctor],
    diagnostico :: Diagnostico
} deriving (Show, Eq)
-- Base de datos de ejemplo:
todosLosTurnos :: [Turno]
todosLosTurnos = [
    UnTurno "ana" ["perez", "gomez"] "gripe",
    UnTurno "luis" ["perez"] "fractura",
    UnTurno "maria" ["lopez"] "alergia",
    UnTurno "sofia" ["gomez", "lopez"] "control"
]
-- Es cierto que un doctor atendio a un paciente determinado
atendio :: Doctor -> Paciente -> [Turno] -> Bool
atendio unDoctor unPaciente turnos = any(atendioEnTurno unDoctor unPaciente) turnos

atendioEnTurno :: Doctor -> Paciente -> Turno -> Bool
atendioEnTurno unDoctor unPaciente unTurno = 
    paciente unTurno == unPaciente &&  elem unDoctor (doctores unTurno)

-- Quien o quienes atendieron a un paciente??
doctoresDe :: Paciente -> [Turno] -> [[Doctor]]
doctoresDe unPaciente turnos = map doctores (filter (\turno -> paciente turno == unPaciente) turnos)

-- Que paciente fue curado/atendido por cierto doctor
pacienteDe :: Doctor -> [Turno] -> [Paciente]
pacienteDe unDoctor turnos = map paciente (filter (\turno -> elem unDoctor (doctores turno)) turnos)

-- Es cierto que cierto doctor atendio a algun paciente sin importar cual
atendioAlgo :: Doctor -> [Turno] -> Bool
atendioAlgo unDoctor turnos = any(\turno -> elem unDoctor (doctores turno)) turnos 

-- Es cierto que cierto paciente existe
existePaciente :: Paciente -> [Turno] -> Bool
existePaciente unPaciente turnos = elem unPaciente(map paciente turnos)