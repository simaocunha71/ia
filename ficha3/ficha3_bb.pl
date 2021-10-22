%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% inteligência Artificial - MiEI/3 LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes sobre listas.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pertence: Elemento,Lista -> {V,F}

/*alinea i*/
pertence( X,[X|_] ).
pertence( X,[Y|L] ) :-
    X \= Y,
    pertence( X,L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: Lista,Comprimento -> {V,F}
/*alinea ii*/
comprimento( [],0 ).
comprimento( [_|L],N ) :-
    comprimento( L,N1 ),
    N is N1+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado quantos: Lista,Comprimento -> {V,F}
/*alinea iii*/

quantos([],0).
quantos([H|T],N) :-
    pertence(H,H|T),
    quantos(T,N).
quantos([H|T], N1) :-
    nao(pertence(H,H|T)),
    quantos(T,N),
    N1 is N+1;

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagar: Elemento,Lista,Resultado -> {V,F}
/*alinea iv*/
apagar( X,[X|R],R).
apagar( X,[Y|R],[Y|L]) :-
    X \= Y,
    apagar( X,R,L).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagatudo: Elemento,Lista,Resultado -> {V,F}
/*alinea v*/
apagatudo(_,[],[]).
apagatudo(X,[X|R],L) :-
    apagatudo(X,R,L).
apagatudo(X,[Y|R],[Y|L]) :-
    X \= Y,
apagatudo(X,R,L).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado adicionar: Elemento,Lista,Resultado -> {V,F}
/*alinea vi*/
adicionar( X,L,L) :-
    pertence(X,L).
adicionar(X,L,[X|L]) :-
    nao(pertence(X,L)).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado concatenar: Lista1,Lista2,Resultado -> {V,F}
/*alinea vii*/
concatenar([], L, L).
concatenar([H|T], L1, [H|R]) :-
    concatenar(T, L1, R).




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado inverter: Lista,Resultado -> {V,F}
/*alinea viii*/
inverter([], []).
inverter([H|T], R) :-
    inverter(T, Z),
    concatenar(Z, [H], R).




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sublista: SubLista,Lista -> {V,F}
/*alinea ix*/
sublista([], _).
sublista([H|T], [H|TS]) :-
    sublista(T, TS).
sublista([H|T], [_|TS]) :-
    sublista([H|T], TS).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}
/*alinea x*/
nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).
