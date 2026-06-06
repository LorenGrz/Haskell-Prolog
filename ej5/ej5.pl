% # Ejercicio 2: Se pide armar el árbol familiar Real Inglés, usando la relación “esHijoDe”
% # ¿Quienes son primos?
% # BD:
esHijoDe(carlosIII, isabelII).
esHijoDe(ana, isabelII).
esHijoDe(andrew, isabelII).
esHijoDe(edward, isabelII).
esHijoDe(henry, carlosIII).
% # ¿Es cierto que la reina Isabel tiene hijos?	
esHijoDe(_,isabelII).
% # ¿Quién o quienes son hijos de la reina Isabel?
esHijoDe(Hijos,isabelII).
% # ¿Quiénes son los nietos del Carlos III?
esNieto(Nieto,Abuelo) :-
    esHijoDe(Nieto,Padre),
    esHijoDe(Padre,Abuelo),
    Nieto \= Abuelo.
% # ¿Es cierto que Archie es primo del príncipe Jorge?
esPrimo(Primo1,Primo2):-
    esHijoDe(Primo1, Padre1),
    esHijoDe(Primo2, Padre2),
    esHijoDe(Padre1, Abuelo),
    esHijoDe(Padre2, Abuelo),
    Primo1 \= Primo2, Padre1\=Padre2.