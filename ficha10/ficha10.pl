%jogo: identificador do jogo, arbitro, apoios de custo -> {V,F,D}
:- op(900, xfy, '::').

jogo(1,'Almeida Antunes',500).
jogo(2,'Baltazar Borges',desconhecido).
jogo(3,'Costa Carvalho', {500,2000}).
jogo(4,'Duarte Durão', [250,750]).
jogo(5,'Edgar Esteves', impossivel).
%jogo(6,'Francisco França',)
%jogo(7,'Guerra Godinho',)
%jogo(8,'Hélder Heitor',)
%jogo(9,'Ivo Inocêncio',)

+jogo(X,Arbitro,Ajudas)::(
	findall(X,jogo(X,Arbitro,Ajudas),List),
	length(List,L),
	L == 1
	).

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


si(Q,desconhecido):-
	not(Q),
	not(-Q).

si(Q,verdadeiro):- Q.

si(Q,falso):- -Q.