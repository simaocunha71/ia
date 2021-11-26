%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% INTELIGENCIA ARTIFICIAL - MiEI/LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic filho/2.
:- dynamic pai/2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F,D}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

pai(P,F) :- filho(F,P).
avo(A,N) :- filho(N,X), filho(X,A).

descendente(D,A,1) :- filho(D,A).
descendente(D,A,G) :-
    filho(D,X),
    descendente(X,A,N),
    G is N+1.

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido

+filho( F,P ) :: (findall( (F,P),(filho( F,P )),S ),
                  length( S,N ), 
				  N == 1
                  ).

+pai(P,F) :: (findall((P,F), (pai(P,F),S)), 
              length(S, N), 
              N == 1).


% Invariante Referencial: nao admitir mais do que 2 progenitores
%                         para um mesmo individuo

+filho( F,P ) :: (findall( PS,(filho( F,PS ),S ),
                  length( S,L ), 
                  L =< 2)).
  
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :-
    findall(Invariantes, +Termo::Invariantes, Lista),
    insercao(Termo),
    teste(Lista).

insercao(Termo) :- assert(Termo).
insercao(Termo) :- retract(Termo), !, fail.

%vai executar(testar) todos os elementos da lista
teste([]).
teste([H|T]) :- H, teste(T).




    


