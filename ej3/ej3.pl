% # -- Resolver un problema para una librería
% # -- ¿Es cierto que alguien escribió una determinada obra?
% # -- ¿Quién o quienes escribieron una obra?
% # -- ¿Qué obra escribió cierta persona?
% # -- Si es cierto que cierta persona escribió alguna obra, sin importar cual.
% # -- Si es cierto que cierta obra existe.

% # -- Base de DATOS
% obra(Titulo, Autores)
titulo(sandman)
titulo(socorro)
titulo(buenosPresagios)

autor(gaiman)
autor(elsaBornemann)
autor(pratchett)

% Relaciones donde se pueden hacer todas las consultas
obra(sandman, gaiman).
obra(socorro, elsaBornemann).
obra(buenosPresagios, gaiman).
obra(buenosPresagios, pratchett).

% Consultas
obra(sandman,coscu)
False

obra(buenosPresagios, Autores)
    gaiman
    prachett

obra(Obra, gaiman)
    buenosPresagios
    sandman

obra(_, gaiman)
    True

titulo(coscu)
    False