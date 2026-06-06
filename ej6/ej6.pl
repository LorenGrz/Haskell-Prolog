% # Ejercicio 4: Analizar la inversibilidad de los siguientes predicados:
%amigo(Uno, Otro)
amigo(nico, fernando).
amigo(axel, Persona) :- Amigo(Persona, nico).
amigo(alf, _).
% No es inversible porque la varriable anonima significa cualquier cosa del 
% universo, y si preguntas amigo(alf, _) Prolog responderia X = _

%id(Algo, LoMismo).
id(X, X)
% Si es inverible

%mayorDeEdad(Persona)
mayorDeEdad(Persona) :- Edad > 18, edad(Persona, Edad).
% No es inversible porque al momento de ingresar, prolog evalua la Edad 
% sin haberla asignado, entonces la correcta forma seria 
% buscar el valor de la Persona, y despues evaluarlo con el 18