% Ejercicio 6: Dado los siguientes partidos responder:
% Los Equipos africanos hacen muchos goles (goles>2).
% Hubo una goleada (>3) entre dos Equipos?.
% BD:
partido(islandia,5,croacia,1).
partido(nigeria,0,argentina,1).
partido(croacia,0,argentina,6).
partido(brasil,5,costaRica,0).
partido(brasil,2,croacia,2).
continente(brasil,america).
continente(croacia,europa).
continente(argentina,america).
continente(costarica,america).
continente(islandia,europa).
continente(nigeria,africa).
descalificado(brasil).
descalificado(alemania).
hacenMuchosGoles(Continente) :-
    continente(Equipo, Continente),
    partido(Equipo,Goles,Equipo2,Goles2),
    Goles > 2.
huboUnaGoleada(Equipo1,Equipo2):-
    partido(Equipo1, Goles, Equipo2, Goles2),
    Diferencia is abs(Goles1 - Goles2),
    Diferencia > 3.