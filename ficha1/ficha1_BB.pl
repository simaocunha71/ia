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

filho( F,P ) :- pai( P,F ).
/*alinea i*/   filho( joao,jose ).
/*alinea ii*/  filho( jose,manuel ).
/*alinea iii*/ filho( carlos,jose ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

/*alinea xii*/ pai( P,F ) :- filho( F,P ).
/*alinea iv*/ pai( paulo,filipe).
/*alinea v*/  pai( paulo,maria).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

/*alinea vi*/   avo( antonio, nadia).
/*alinea xiii*/ avo( A,N ) :- filho( N,X ), pai( A,X ).
/*alinea xvii*/ avo( A,N ) :- descendente( N,A,2 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Neto,Avo -> {V,F}

/*alinea xiv*/ neto (N,A) :- avo( A,N ).
/*alinea vii*/ neto( nuno, ana).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado masculino

/*alinea viii*/ masculino(joao).
/*alinea ix*/   masculino(jose).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado feminino

/*alinea x*/  feminino(maria).
/*alinea xi*/ feminino(joana).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

/*alinea xviii*/ bisavo( A,D ) :- descendente( D,A,3 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

/*alinea xv*/ descendente( D,A ) :- filho( D,A ).
descendente( D,A ) :- filho( D,X ), descendente( X,A ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

descendente( D,A,1 ) :- filho( D,A ).
/*alinea xvi*/ descendente( D,A,G ) :- filho( D,X), descendente( X,A,N ), G is N+1.
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
/*alinea xix*/ trisavo( X,Y ) :- descendente( Y,X,4 ).
/*alinea xx*/ tetraneto( X,Y ) :- descendente ( X,Y,5).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
/*alinea xxi*/ 
