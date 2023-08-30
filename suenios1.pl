%Punto 1 (2 puntos)

%Base de conocimiento

%creyenteDe(Persona,[Personajes])
creyenteDe( gabriel, [campanita, magoDeOz, cavenaghi]).

creyenteDe(juan, conejoDePascua).

creyenteDe(macarena,[reyesMagos, magoCapria, campanita]).

%Por principio de Universo Cerrado, como Diego no cree en nadie no es un dato relevante y no se declara en la base de conocimiento.

%suenios (Persona, [TiposDeSuenios])

%Gabriel quiere ganar la lotería apostando al 5 y al 9, y también quiere ser un futbolista de Arsenal

suenio(gabriel, [ganarLaLoteria([5,9]),futbolista(arsenal)]).

%Juan quiere ser un cantante que venda 100.000 “discos”

suenio(juan, cantante(100000)).

%Macarena no quiere ganar la lotería, sí ser cantante estilo “Eruca Sativa” y vender 10.000 discos
%Por principio de Universo Cerrado no se define que no quiere ganar la lotería ni el Estilo de cantante, dado que no son relevantes para el diseño de la solución.

suenio(macarena, cantante(10000)).

%Punto 2



