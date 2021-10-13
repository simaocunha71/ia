%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Inteligência Artificial MIEI /3  LEI/3
/*
Como carregar este ficheiro para o SwiProlog?
    > swipl -s [filename] 
*/
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

% Esta linha por algum motivo entra em conflito com a linha 25 -> filho( F,P ) :- pai( P,F ).
/*alinea i*/   
filho( joao,jose ).
/*alinea ii*/  
filho( jose,manuel ).
/*alinea iii*/ 
filho( carlos,jose ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

/*alinea xii*/ 
pai( P,F ) :- filho( F,P ).
/*alinea iv*/ 
pai( paulo,filipe).
/*alinea v*/  
pai( paulo,maria).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

/*alinea xiii*/ 
avo( A,N ) :- filho( P,A ), filho(N,P).
/*alinea xvii*/ 
avo( A,N ) :- descendente( N,A,2 ).
/*alinea vi*/   
avo( antonio, nadia).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Neto,Avo -> {V,F}

/*alinea xiv*/ 
neto(N,A) :- filho(N,P),filho(P,A).
/*alinea vii*/ 
neto(nuno,ana).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado masculino

/*alinea viii*/ 
masculino(joao).
/*alinea ix*/   
masculino(jose).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado feminino

/*alinea x*/  
feminino(maria).
/*alinea xi*/ 
feminino(joana).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

/*alinea xviii*/
bisavo( A,D ) :- descendente( D,A,3 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

/*alinea xv*/ 
descendente( D,A ) :- filho( D,A );	filho( D, X), descendente(X,A).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

/*alinea xvi*/ 
descendente( D,A,1) :- filho(D,A).	%	caso de paragem
descendente(D, A, G) :- filho(D, X), descendente(X, A, N), G is N+1.
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
/*alinea xix*/ 
trisavo( X,Y ) :- descendente( Y,X,4 ).
/*alinea xx*/ 
tetraneto( X,Y ) :- descendente( X,Y,5 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
/*
As formulas lógicas aqui criadas são para testar com o swipl 

-alinea xxi 
filho( joao,jose ).

-alinea xxii
pai(jose,joao).

-alinea xxiii
masculino(joao).

-alinea xxiv
feminino(jose).

-alinea xxv
filho(_,jose).

-alinea xxvi
filho(jose,joao).

-alinea xxvii
avo(manuel,jose).

-alinea xxviii
avo(manuel,joao).

-alinea xxix
neto(carlos,_).

-alinea xxx
descendente(joao,manuel,_).

-alinea xxxi
filho(X,jose), descendente(X,manuel,_).

-alinea xxxii
descendente(X,manuel), filho(X,jose).

-alinea xxxiii
descendente(joao,jose,X).

-alinea xxxiv
descendente(joao,jose,2).

-alinea xxxv
descendente(joao,manuel,X).

-alinea xxxvi
descendente(joao,manuel,X), X>2.

*/