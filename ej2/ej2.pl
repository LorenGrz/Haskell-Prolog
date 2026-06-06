% # Teniendo un juego de cartas con superhéroes y para cada superhéroe se tiene información de sus poderes.
% # Se pide extender las cartas para incluir tags y definir funciones para cambiarlos
% # Dado un mazo de cartas:
% # Obtener los nombres de las cartas que
% #  comienzan con “bat”
% # Averiguar si hay cartas con los tags 
% # demasiado largos.
% # Corregir las cartas a las que pusieron 
% # tag #alguien en lugar de #alien

% carta(Nombre, ListaDePoderes, ListaDeTags)

carta(iron_man, [volar, disparar_laser, super_inteligencia], [vengador, humano, millonario]).
carta(thor, [controlar_trueno, fuerza_sobrehumana, volar], [vengador, dios]).
carta(wolverine, [garras_adamantium, regeneracion], [mutante, x_men, solitario]).
carta(spider_man, [sentido_aracnido, trepar_paredes, lanzar_telarañas], [vengador, humano, adolescente]).
carta(storm, [controlar_clima, volar], [mutante, x_men]).

% agregarTag(TagNuevo, CartaOriginal, CartaNueva)
% Si la carta original ya tiene el tag, la nueva queda igual (para no duplicar)
agregarTag(Tag, carta(Nombre, Poderes, Tags), carta(Nombre, Poderes, Tags)) :-
  member(Tag, Tags).

% Si no lo tiene, lo agregamos al principio de la lista de tags [Tag|Tags]
agregarTag(Tag, carta(Nombre, Poderes, Tags), carta(Nombre, Poderes, [Tag|Tags])) :-
  not(member(Tag, Tags)).

% removerTag(TagAEliminar, CartaOriginal, CartaNueva)
removerTag(Tag, carta(Nombre, Poderes, TagsOriginales), carta(Nombre, Poderes, TagsNuevos)) :-
  delete(TagsOriginales, Tag, TagsNuevos).

cartaComienzaConTag(Nombre) :-
  carta(Nombre,_,_),sub_atom(Nombre,0,3,_,bat).

tieneTagLargo(NombreCarta, Tag) :-
    carta(NombreCarta, _, Tags),       % Agarramos la lista de tags de una carta
    member(Tag, Tags),                 % Evaluamos un tag de la lista
    atom_length(Tag, Longitud),        % Contamos sus letras
    Longitud > 10.                     % Limite demasiado largo ej 10

% corregirListaTags(ListaVieja, ListaNueva)
% Caso base: si la lista está vacía, terminamos.
corregirListaTags([], []).

% Si el primer elemento es 'alguien', lo cambiamos por 'alien' en la nueva lista y seguimos recursivamente
corregirListaTags([alguien|ColaVieja], [alien|ColaNueva]) :-
    !, % Usamos un corte para que no intente la regla de abajo si enganchó esta
    corregirListaTags(ColaVieja, ColaNueva).

% Si es cualquier otra cosa (X), lo dejamos como está y seguimos recorriendo la lista
corregirListaTags([X|ColaVieja], [X|ColaNueva]) :-
    corregirListaTags(ColaVieja, ColaNueva).

% corregirCarta(CartaOriginal, CartaCorregida)
corregirCarta(carta(Nombre, Poderes, TagsViejos), carta(Nombre, Poderes, TagsNuevos)) :-
    corregirListaTags(TagsViejos, TagsNuevos).
