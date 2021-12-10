:- op(900, xfy, '::').
%------------------------------------------------------------------
servico(ortopedia, amelia).
servico(obstetricia,ana).
servico(obstetricia,maria).
servico(obstetricia,mariana).
servico(geriatria,sofia).
servico(geriatria,susana).

servico(x007,teodora). 
servico(np9,zulmira).

% #AAA sao valores nulos do tipo incerto
excecao(servico(_,E)) :-
    servico(x007,E).

% @AAA sao valores nulos do tipo interdito
excecao(servico(np9,E)) :-
    servico(np9,E).
nulo(np9).

+servico(S,_) :: (findall(S,
                         servico(S,zulmira), 
                         nao(nulo(S)),
                         L),
                 length(L, S),
                 S==0).
                 


%------------------------------------------------------------------
ato(penso,ana,joana,sabado).
ato(gesso,amelia,jose,domingo).
