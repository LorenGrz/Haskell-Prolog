# Generador de cartas:
# cartaDeTruco(carta(Numero,Palo)):- palo(Palo), numeroValido(Numero).
# palo(basto).
# palo(oro).
# palo(espada).
# palo(copa).
# numeroValido(N):- between(1,12,N), not between(8,9,N).
# Nuevo predicado mata:
# mata(Mayor, Menor):-cartaDeTruco(Mayor), cartaDeTrucoMenor, valeMas(Mayor,Menor).
# mata(Mayor,Menor):-cartaDeTruco(Mayor), cartaDeTruco(Otra), valeMas(Mayor,Otra), mata(Otra,Menor).