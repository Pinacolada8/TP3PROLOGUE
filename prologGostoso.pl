% Questao 1
nelementos([], 0).
nelementos([_|L],S) :- nelementos(L,K), S is K+1.

% Questao 2
maior([X],X).
maior([A,B],M) :- A > B ->  M = A;M = B. 
maior([A|B],M) :- maior(B,X),(    A > X ->  M = A; M = X ).

soma([A],A).
soma([A|B],S) :- soma(B,X), S is A + X.

% Questao 3
medio(A,M) :- nelementos(A,Y), soma(A,X), M is X/Y.

% Questao 4
inserirfim(A, [], [A]).
inserirfim(A, [X|B], [X|C]) :- inserirfim(A, B, C).

% Questao 5
ultimo([H|[]],H).
ultimo([_|T],U) :- ultimo(T,U).

% Questao 6
adjacente(A,B,[B,A|_]).
adjacente(A,B,[A,B|_]).
adjacente(A,B,[_|T]) :- adjacente(A,B,T).

% Questao 7
gerar(B,B,[B]).
gerar(A,B,[A|X]) :- Y is A+1,gerar(Y,B,X).

% Questao 8
reverter([], _).
reverter([A|B], L) :-  reverter(B,X), inserirfim(A,X,L).

% Questao 9
incrementar([],[]).
incrementar([H|T], [Y|L]) :- Y is H+1, incrementar(T,L). 

% Questao 10
linearizar([],[]).
linearizar([A|B],L) :- anexar(A,X,L), linearizar(B,X).

% Questao 11
anexar([], L, L).
anexar([X|L1], L2, [X|L3]) :- anexar(L1, L2, L3).

% Questao 12
remover(_,[],[]).
remover(X, [A|B], L) :- remover(X,B,R), (   X == A -> anexar([],R,L); anexar([A],R,L)).  

% Questao 13
rotacionar([A|B],L):- inserirfim(A,B,L).

% Questao 14
rotacionarn(1,A,L) :- rotacionar(A,L).
rotacionarn(X, A, L) :- rotacionar(A,R), Y is X - 1, rotacionarn(Y,R,L).

% Questao 15
ordenar([],[]).
ordenar(A, L) :- maior(A,X), remover(X,A,R),ordenar(R,Y), inserirfim(X,Y,L).
