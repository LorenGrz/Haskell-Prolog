% # Ejercicio 5: Dado el predicado inversible padre/2 
% definir los predicados abuelo/2, hermano/2 y ancestro/2

% # -- El siguiente predicado hermano es inversible?
% # -- hermano(Uno, Otro) :- padre(Alguien,Uno), Uno \= Otro, padre(Alguien,Otro).
% No no es inversible pero por un tema de orden, si vos lo haces de esta manera, 
% estas comparando uno con vacio y eso daria error en prolog, ya que no puede 
% asegurar prolog que sean distintos
% # -- Como serían los predicados de Primo? Y de Tio?
padre(Padre, Hijo)
abuelo(Abuelo, Nieto) :-
    padre(Abuelo, Padre),
    padre(Padre, Nieto),
    Abuelo\=Nieto.
hermano(Hermano1, Hermano2):-
    padre(Padre, Hermano1),
    padre(Padre, Hermano2),
    Hermano1 \= Hermano2.
ancestro(Ancestro, Descendiente):-
    padre(Ancestro, Descendiente),
    ancestro(Intermedio, Descendiente).