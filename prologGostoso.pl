nelementos([], 0).
nelementos([_|L],S) :- nelementos(L,K), S is K+1.

maior([X],X).
maior([A,B],M) :- A > B ->  M = A;M = B. 
maior([A|B],M) :- maior(B,X),(    A > X ->  M = A; M = X ).

soma([A],A).
soma([A|B],S) :- soma(B,X), S is A + X.

medio(A,M) :- nelementos(A,Y), soma(A,X), M is X/Y.

inserirfim(A, [], [A]).
inserirfim(A, [X|B], [X|C]) :- inserirfim(A, B, C).

ultimo([H|[]],H).
ultimo([_|T],U) :- ultimo(T,U).

adjacente(A,B,[B,A|_]).
adjacente(A,B,[A,B|_]).
adjacente(A,B,[_|T]) :- adjacente(A,B,T).

gerar(B,B,[B]).
gerar(A,B,[A|X]) :- Y is A+1,gerar(Y,B,X).

reverter([], _).
reverter([A|B], L) :-  reverter(B,X), inserirfim(A,X,L).

incrementar([],[]).
incrementar([H|T], [Y|L]) :- Y is H+1, incrementar(T,L). 

linearizar([],[]).
linearizar([A|B],L) :- anexar(A,X,L), linearizar(B,X).

anexar([], L, L).
anexar([X|L1], L2, [X|L3]) :- anexar(L1, L2, L3).

remover(_,[],[]).
remover(X, [A|B], L) :- remover(X,B,R), (   X == A -> anexar([],R,L); anexar([A],R,L)).  
