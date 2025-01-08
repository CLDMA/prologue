homme(pierre).
homme(marc).
homme(paul).
homme(jacques).
femme(marie).
femme(sophie).
femme(julie).

parent(pierre, paul).
parent(marie, paul).
parent(marc, sophie).
parent(jacques, marc).
parent(julie, sophie).

pere(X, Y) :- homme(X), parent(X, Y).
mere(X, Y) :- femme(X), parent(X, Y).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

frere_ou_soeur(X, Y) :- parent(P, X), parent(P, Y), not(X=Y).

longueur([], 0).
longueur([_ | Queue], N) :- longueur(Queue, M), N is M + 1.


element(X, [X | _]).
element(X, [_ | Tail]) :- element(X, Tail).


oncletante(X, Y) :- frere_ou_soeur(X, Z), parent(Z, Y).

consin(X, Y) :- parent(Z, X), frere_ou_soeur(Z, W), parent(W, Y).