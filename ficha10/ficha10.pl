%jogo: identificador do jogo, arbitro, apoios de custo -> {V,F,D}
jogo(1,aa,500).
jogo(2,bb,xpto0123).

-jogo(Id,Arbitro,Ajudas):-
	not(jogo(Id,Arbitro,Ajudas)),
	not(excecao(jogo(Id,Arbitro,Ajudas))).

excecao(jogo(Id,Arbitro,_)):-
	jogo(Id,Arbitro,xpto0123).

excecao(jogo(3,cc,500)).

excecao(jogo(3,cc,2500)).

excecao(jogo(4,dd,Ajudas)):-
	Ajudas >= 250,
	Ajudas =< 750.


excecao(jogo(5,ee,_)).


+jogo(X,Arbitro,Ajudas)::(
	findall(X,jogo(X,Ar,Aj),List),
	length(List,L),
	L == 1
	).


si(Q,desconhecido):-
	not(Q),
	not(-Q).

si(Q,verdadeiro):- Q.

si(Q,falso):- -Q.