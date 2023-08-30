% PARCIAL suenios

% Tipos de sueños:
% ser un cantante y vender una cierta cantidad de “discos” (≅ bajadas)
% ser un futbolista y jugar en algún equipo
% ganar la lotería apostando una serie de números

% 1. Lógica de negocio

% Gabriel quiere ganar la lotería apostando al 5 y al 9, y también quiere ser un futbolista de Arsenal
suenio(gabriel, loteria(5,9)).
suenio(gabriel, futbolista(arsenal)).
% Juan quiere ser un cantante que venda 100.000 “discos”
suenio(juan, cantante(100000)).
% Macarena no quiere ganar la lotería, sí ser cantante estilo “Eruca Sativa” y vender 10.000 discos
suenio(macarena, cantante(10000)).

% No modelado:
% Macarena no quiere ganar la loteria, por principio de universo cerrado.

persona(Persona):- suenio(Persona,_).

% 2. Persona ambiciosa
esAmbiciosa(Persona):- persona(Persona),
                dificultadesSuenios(Persona, SumaDificultades),
                SumaDificultades > 20.

dificultadesSuenios(Persona,SumaDificultades):- suenio(Persona,_),
            findall(Dificultad, (suenio(Persona,Suenio), dificultad(Suenio, Dificultad)), Dificultades),
            sumlist(Dificultades, SumaDificultades).

dificultad(loteria(Inf,Sup), Dificultad):- Dificultad is (Sup - Inf)* 10.
dificultad(futbolista(Equipo), 3):- equipoChico(Equipo).
dificultad(futbolista(_), 16).
dificultad(cantante(Cantidad), 6):- Cantidad > 500000.
dificultad(cantante(Cantidad), 4):- Cantidad =< 500000.

equipoChico(arsenal).
equipoChico(aldosivi).

% 3. tienen quimica 
creeEn(gabriel,campanita).
creeEn(gabriel,magoDeOz).
creeEn(gabriel,cavenaghi).
creeEn(juan, conejoDePascua).
creeEn(macarena, reyesMagos).
creeEn(macarena, magoCapria).
creeEn(macarena, campanita).

% Diego no cree en nadie
% Por principio de universo cerrado no lo modelo.

tienenQuimica(Persona,Personaje):- creeEn(Persona,Personaje), cumpleCondicionQuimica(Persona, Personaje).

cumpleCondicionQuimica(Persona, campanita):- suenio(Persona, Suenio), dificultad(Suenio,Dificultad), Dificultad<5.
cumpleCondicionQuimica(Persona,_):- not(esAmbiciosa(Persona)), tieneSueñosPuros(Persona).

tieneSueñosPuros(Persona):- suenio(Persona, futbolista(_)).
tieneSueñosPuros(Persona):- suenio(Persona, cantante(Cantidad)), Cantidad=<200000.

% 4. puede algregar una persona
esAmigo(campanita, reyesMagos).
esAmigo(campanita, conejoDePascua).
esAmigo(conejoDePascua, cavenaghi).
estaEnfermo(campanita).
estaEnfermo(reyesMagos).
estaEnfermo(conejoDePascua).

puedeAlegrar(Personaje,Persona):- suenio(Persona,_), tienenQuimica(Persona,Personaje), cumpleCondicionAlegrar(Personaje).

cumpleCondicionAlegrar(Personaje):- sinEnfermedad(Personaje).
cumpleCondicionAlegrar(Personaje):- estaEnfermo(Personaje), sonAmigos(Personaje,AmigoBackup), sinEnfermedad(AmigoBackup).

sinEnfermedad(Personaje):- not(estaEnfermo(Personaje)).

sonAmigos(Personaje,Amigo):- esAmigo(Personaje,Amigo).
sonAmigos(Personaje,Amigo):- esAmigo(Personaje,AmigoIntermedio),esAmigo(AmigoIntermedio,Amigo), AmigoIntermedio \= Amigo, AmigoIntermedio \= Personaje.