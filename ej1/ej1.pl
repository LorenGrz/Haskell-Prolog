# Ejercicio 1:Dado el predicado come/2 que relaciona a un animal con otro al cual se come, modelar los siguientes predicados:
# Hostil/1: Relaciona un animal con un bioma si todos los animales que lo habitan se lo comen.
# Terrible/1: Relaciona un animal con un bioma si todos los animales que se lo comen habitan ahí.
# Compatibles/2: Relaciona dos animales si ninguno de los dos se come al otro.
# Adaptable/1: Se cumple para todos los animales que habitan en todos los biomas.
# Raro/1: Se cumple para todos los animales que habitan en un único bioma.
# Dominante/1: Se cumple para todos los animales que se comen a todos los otros animales del bioma en el que viven.
% base de datos
habita(Animal, Bioma)
animal(Animal)
come(Comedor, Comido)

% predicados
hostil(Animal, Bioma) :-
    animal(Animal), habita(_, Bioma),
    forall(habita(OtroAnimal, Bioma), come(OtroAnimal, Animal)).

terrible(Animal, Bioma) :-
    animal(Animal), habita(_, Bioma),
    forall(come(OtroAnimal, Animal), habita(OtroAnimal, Bioma)).

compatibles(UnAnimal, OtroAnimal) :-
    animal(OtroAnimal), animal(UnAnimal),
    not(come(UnAnimal, OtroAnimal)),
    not(come(OtroAnimal, UnAnimal)).

adaptable(Animal) :-
    animal(Animal),
    forall(habita(_, Bioma), habita(Animal, Bioma)).

raro(Animal) :-
    habita(Animal, Bioma),
    not((habita(Animal, OtroBioma), OtroBioma \= Bioma)).

dominante(Animal) :-
    habita(Animal, Bioma),
    forall((habita(OtroAnimal, Bioma), OtroAnimal \= Animal), come(Animal, OtroAnimal)).