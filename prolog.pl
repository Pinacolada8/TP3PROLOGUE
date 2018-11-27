nelementos([], 0).
nelementos([_|L],S) :- nelementos(L,K), S is K+1.
