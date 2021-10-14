%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Inteligência Artificial - MiEI/3 LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes aritmeticas.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Soma -> {V,F}
/*alinea i*/
soma2(X,Y,Soma2) :- Soma2 is X + Y. 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Z,Soma -> {V,F}
/*alinea ii*/
soma3(X,Y,Z,Soma3) :- Soma3 is X + Y + Z.

/*alinea iii*/
op(X,Y,+,Res) :- Res is X + Y.
op(X,Y,-,Res) :- Res is X - Y.
op(X,Y,*,Res) :- Res is X * Y.
op(X,Y,/,Res) :- Res is X / Y.

/*alinea iv*/
maior(X,Y,R) :- R is max(X, Y).

/*alinea v*/
maior3(X,Y,Z,R) :- R is max(X, max(Y, Z)).

/*alinea vi*/
menor(X,Y,R) :- R is min(X, Y).

/*alinea vii*/
menor3(X,Y,Z,R) :- R is min(X, min(Y, Z)).

/*alinea viii*/
isPar(X) :- mod(X,2) =:= 0.

/*alinea ix*/
isImpar(X) :- mod(X,2) =\= 0.

/*alinea x*/
mdc(X,X,X).
mdc(X,Y,R) :- X < Y, Y1 is Y-X, mdc(X,Y1,R).
mdc(X,Y,R) :- X > Y, mdc(Y,X,R).

/*alinea xi*/
mmc(X,Y,R) :- mdc(X,Y,Aux), R is X * Y / Aux.

/*alinea xii
?- soma2(1,3,X).
X = 4.
*/

/*alinea xiii
?- soma3(1,3,5,X).
X = 9.
*/

/*alinea xiv
?- op(2,4,*,X).
X = 8 .
*/

/*alinea xv
?- soma3(5,3,1,X).
X = 9.
*/

/*alinea xvi
?- maior(1,3,X).
X = 3.
*/

/*alinea xvii
?- maior(3,1,X).
X = 3.
*/

/*alinea xviii
?- maior(3,1,X).
X = 3.

?- menor(3,2,Y), Y =:= 3.
false.
*/

/*alinea xix
?- maior3(5,3,7,X).
X = 7.
*/

/*alinea xx
?- menor3(2,4,6,X).
X = 2.
*/
