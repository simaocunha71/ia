%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% InteligÃªncia Artificial MIEI /3  LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica 
% Pesquisa Informada (Ficha 6)

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento

estimado(a, 5).
estimado(b, 4).
estimado(c, 4).
estimado(d, 3).
estimado(e, 7).
estimado(f, 4).
estimado(g, 2).
estimado(s, 10).
estimado(t, 0).

aresta(s, a, 2).
aresta(a, b, 2).
aresta(b, c, 2).
aresta(c, d, 3).
aresta(d, t, 3).
aresta(s, e, 2).
aresta(e, f, 5).
aresta(f, g, 2).
aresta(g, t, 2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

not( Questao ) :- Questao, !, fail.
not( Questao ).

member( X, [X|_] ).
member( X, [_|Xs] ) :- member( X, Xs ).

invert( Xs, Ys ) :- invert( Xs, [], Ys ).
invert( [], Xs, Xs ).
invert( [X|Xs], Ys, Zs ) :- invert(Xs, [X|Ys], Zs).

min( [(P,X)], (P,X) ).
min( [(P,X)|L], (Py,Y) ) :- min( L, (Py,Y) ), X>Y.
min( [(Px,X)|L], (Px,X) ) :- min( L, (Py,Y) ), X=<Y.

select( E, [E|Xs], Xs ).
select( E, [X|Xs], [X|Ys] ) :- select( E, Xs, Ys ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

aresta( Node, Next ) :- aresta( Node, Next, _ ).

start( s ).

end( t ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

adjacente( Node, Next ) :- aresta( Node, Next, _ ).
adjacente( Node, Next ) :- aresta( Next, Node, _ ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

primProf( Node, _, [] ) :- end( Node ).

solvePrimProf( Node, [Node|Path] ) :- primProf( Node, [Node], Path ).

primProf( Node, Hist, [Next|Path] ) :- adjacente( Node, Next ),
                                       not( member( Next, Hist) ),
                                       primProf( Next, [Next|Hist], Path ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

allSol( L ) :- findall( ( S, C ),
               (solvePrimProf( s, S )),
               length( S, Int),
               L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

prof( Dest, Dest, H, D ) :- invert( H,D ).
prof( Source, Dest, His, C ) :- adjacente( Source, Nex ),
                                not( member( Nex, His ) ),
                                prof( Nex, Dest, [Nex|His], C ).
 
solvPPMult( NodeStart, NodeEnd, [Node|Path] ) :- prof( NodeStart, NodeEnd, [NodeStart], Path ).

adjacenteCost( Node, Next, Cost ) :- aresta( Node, Next, Cost ).
adjacenteCost( Node, Next, Cost ) :- aresta( Next, Node, Cost ).

primProfCost( Node, _, [], 0 ) :- end(Node).
primProfCost( Node, Hist, [Next|Path], Cost ) :- adjacenteCost( Node, Next, CostMov ),
                                                 not( member( Next, Hist) ),
                                                 primProfCost( Next, [Next|Hist], Path, Cost2 ),
                                                 Cost is CostMov + Cost2.

solvePrimProfCost( Node, [Node|Path], Cost ) :- primProfCost( Node, [Node], Path, Cost ). 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

ppCostAllSol( L ) :- findall( ( S, C ),
                     (solvePrimProfCost( s, S, C )),
                     L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

best( Node, Cam, Cost ) :- findall( ( Ca, Cos ),
                           solvePrimProfCost( Node, Ca, Cos ),
                           L ),
                           min( L,
                               ( Cam, Cost ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

getBestG( [Path], Path ) :- !.
getBestG( [Path1/Cost1/Est1,_/Cost2/Est2|Paths], Best ) :- Est1 =< Est2,
                                                           !,
                                                           getBestG([Path1/Cost1/Est1|Paths], Best).
getBestG([_|Paths], Best) :- getBestG( Paths, Best ).                                

adjacenteG( [Nodo|Path]/Cost/_, [Next,Node|Path]/New/Est ) :- aresta( Node, Next, PassCost ),
                                                             \+ member( Next, Path ),
                                                             New is Cost + PassCost,
                                                             estimado( Next, Est ).

bigGreed( Path, ExPaths ) :- findall( New,
                                      adjacenteG( Path, New ),
                                      ExPaths ).

greedy( Paths, Path ) :- getBestG( Paths, Best ),
                         select( Best, Paths, Other ),
                         bigGreed( Best, ExPaths ),
                         append( Other, ExPaths, NewPaths ),
                         greedy( NewPaths, SolPath ).

solveGreed( Node, Path/Cost ) :- estimado( Node, estimado ),
                                 greedy( [[Node]/0/estimado], InvPath/Cost/_ ),
                                 invert( InvPath, Path ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

getBest( [Path], Path ) :- !.
getBest( [Path1/Cost1/Est1,_/Cost2/Est2|Paths], Best ) :- Cost1 + Est1 =< Cost2 + Est2,
                                                          !,
                                                          getBest( [Path1/Cost1/Est1|Paths], Best ).
getBest( [_|Paths], Best ) :- getBest( Paths, Best ).          

bigStar( Path, ExPaths ) :- findall( New,
                                     adjacenteG( Path, New ),
                                     ExPaths ).

star( Paths, Path ) :- getBest( Paths, Path ), 
                       Path = [Node|_]/_/_, 
                       end( Node ).

star( Paths, SolPath ) :- getBest( Path, Best ),
                          select( Best, Path, Other ),
                          bigStar( Best, ExPaths ),
                          append( Other, ExPaths, NewPaths ),
                          star( NewPaths, SolPath ).

solveStar( Node, Path/Cost ) :- estimado( Node, estimado ),
                                star( [[Node]/0/estimado], InvPath/Cost/_ ),
                                invert( InvPath, Path ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -