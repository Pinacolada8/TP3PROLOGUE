nelementos([], 0).
nelementos([_|L],S) :- nelementos(L,K), S is K+1.

maior([X],X).
maior([A,B],M) :- A > B ->  M = A;M = B. 
maior([A|B],M) :- maior(B,X),(    A > X ->  M = A; M = X ).

soma([A],A).
soma([A|B],S) :- soma(B,X), S is A + X.

medio(A,M) :- nelementos(A,Y), soma(A,X), M is X/Y.

inserirFim(A, [], [A]).
inserirFim(A, [X|B], [X|C]) :- inserirFim(A, B, C).

ultimo([X|[]], X).
ultimo([_|X], S) :- ultimo(X,S).

adjacente(A,B,[C,D|[]]) :- A == C, B == D; A == D, B == C.
adjacente(A,B,[C,D|E]) :- A == C, B == D; A == D, B==C; adjacente(A,B,E). 

gerar(A,A,[A]).
gerar(A,B,[A|L]) :- C is A+1, gerar(C,B,L).

reverter([_|[]], _).
reverter([A|B], C) :- inserirFim(A,B,C), reverter(B,C).

linearizar([A], L).



concatenar([], L, L).
concatenar([X|L1], L2, [X|L3]) :- concatenar(L1, L2, L3).
