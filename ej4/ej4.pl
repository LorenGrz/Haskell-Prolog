% # -- Ejercicio 1: Resolver un problema para una consultora
% # -- BD:
programaEn(maria, cobol).
programaEn(maria, java).
programaEn(mario, cobol).
programaEn(mario, python).
programaEn(jose, cobol).
programaEn(jorge,java).
programaEn(jorge,python).

% # -- ¿Es cierto que alguien programa en Cobol?
programaEn(_,cobol).
% # -- ¿Quién o quienes programan en Cobol?
programaEn(Programador,cobol).
% # -- ¿Qué lenguajes maneja María?
programaEn(maria,Lenguajes).
% # -- ¿Maria y Mario son colegas?
sonColegas(Programador1,Programador2) :-
    programaEn(Programador1, Lenguaje), 
    programaEn(Programador2, Lenguaje),
    Programador1 \= Programador2.
% Tambien se puede consultar directamente
programaEn(maria,Lenguaje), programaEn(mario, Lenguaje).

% # -- ¿Quienes son colegas de lenguajes?
sonColegas(Programador1, Programador2)
o
?- programaEn(Programador1, Lenguaje), programaEn(Programador2, Lenguaje), Programador1 @< Programador2.
