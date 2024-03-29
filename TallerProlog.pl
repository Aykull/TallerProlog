%Se definen hechos para un �rbol
%familiar
%
progenitor(clara,jose).
progenitor(tomas,jose).
progenitor(tomas,isalbel).
progenitor(jose,patricia).
progenitor(jose,ana).
progenitor(patricia,jaime).
progenitor(juan,maria).

%para preguntar por el abuelo de Jaime
%
abuelo(X,Y):-
    progenitor(Z,Y),
    progenitor(X,Z).

%para preguntar por el bisabuelo
%
bisabuelo(X,Y):-
    progenitor(Z,Y),progenitor(W,Z),progenitor(X,W).

%Definir los hechos
%
valioso(oro).
mujer(ana).
mujer(alice).
mujer(victoria).
varon(albert).
varon(edward).
tiene(juan,oro).
prestar(juan,maria,libro).
prestar(juan,pedro,lapiz).
prestar(pedro,juan,borrador).
padres(edward,victoria,albert).
padres(alice,victoria,albert).

%Una regla para hermanDe(X,Y), ser�a
%
hermanaDe(X,W):-
    mujer(X),
    padres(X,Y,Z),
    padres(W,Y,Z),
    not(X=W),!.

%Hechos para la funci�n miembro.
%
miembro(X,[X|_]).
miembro(X,[_|Z]):-
    miembro(X,Z).

%Hechos para la funci�n inversa.
%
inversa(L1,L):-inversa(L1,[],L).
inversa([],L,L).
inversa([X|L1],L2,L3):-inversa(L1,[X|L2],L3).

%Cl�usulas para longitud
%
longitud([],0).
longitud([_|Resto],C):-longitud(Resto,C1),C is C1 + 1.

%Acontecimientos
acontecimiento(1943,"En el 1943 se public� El Principito").
acontecimiento(2007,"En el 2007 se public� El Nombre del Viento").
acontecimiento(1902,"En el 1902 se public� El perro de los Baskerville").

consulta:- write("Digite fecha"),read(Fecha),acontecimiento(Fecha,Libro),write(Libro).








