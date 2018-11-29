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
