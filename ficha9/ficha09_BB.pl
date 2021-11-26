%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% ITELIGÊNCIA ARTIFICIAL - MiEI/LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PROLOG: definicoes iniciais

:- dynamic '-'/1.
:- dynamic mamifero/1.
:- dynamic morcego/1.



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
cao(boby).
avestruz(trux).
pinguim(pingu).
morcego(batemene).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

voa( X ) :-
    ave( X ),
    nao(excecao(voa( X ))).
voa(X) :-
	excecao(-voa( X )).
-voa( tweety ).
-voa( X ) :-
    mamifero( X ),
    nao(excecao(-voa( X ))).
-voa( X ) :- excecao(voa( X ))

excecao( voa( X ) ) :-
	avestruz( X ),
	pinguim( X ).

excecao( -voa( X ) ) :-
	morcego( X ).

ave(pitigui).

ave( X ) :- canario( X ).
ave( X ) :- periquito( X ).	
ave( X ) :- avestruz( X ).	
ave( X ) :- pinguim( X ).	
	
canario(piupiu).
mamifero(silvestre).

mamifero ( X ) :- cao( X ).
mamifero ( X ) :- gato( X ).
mamifero ( X ) :- morcego( X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).