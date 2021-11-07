%estado inicial
inicial(jarros(0,0)).

%estados finais
final(jarros(4,_)).
final(jarros(_,4)).

%transiçoes possiveis transicao: EI x OP x Ef
transicao(jarros(V1,V2), encher(1), jarros (8, V2)) :- V1 < 8.
transicao(jarros(V1,V2), encher(2), jarros (V1, 5)) :- V2 < 5.

transicao(jarros(V1,V2), vazio(1), jarros(0,V2)) :- V1 > 0.
transicao(jarros(V1,V2), vazio(1), jarros(V1,0)) :- V2 > 0.

transicao(jarros(V1,V2), encher(1,2), jarros(NV1,NV2)) :-
	V1 > 0,
	NV1 is max(V1 -5 + V2, 0),
	NV1 < V1,
	NV2 is V2 + V1 - NV1.

transicao(jarros(V1,V2), encher(2,1), jarros(NV1,NV2)) :-
	V2 > 0,
	NV2 is max(V2 -8 + V1, 0),
	NV2 < V2,
	NV1 is V1 + V2 - NV2.

%d
resolvedf(Solucao) :-
	inicial(InicialEstado),
	resolvedf(InicialEstado, [InicialEstado], Solucao).

resolvedf(Estado, Historico, []) :-
	final(Estado),!,write(historico).

resolvedf(Estado,Historico, [Move|Solucao]) :-
	transicao(Estado, Move, OutroEstado),
	nao(membro(OutroEstado, Historico)),
	resolvedf(OutroEstado, [OutroEstado|Historico], Solucao).

todos(L) :- findall((S,C), (resolvedf(S), length(S,C)),L).

melhor(S,Custo) :- findall((S,C), (resolvedf(S), length(S,C)),L), minimo(L,(S,Custo)).