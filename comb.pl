suma([],C,C).
suma([H|T],C,R):-S1 is C+H,suma(T,S1,R).

produs([],C,C).
produs([H|T],C,R):-P1 is C*H, produs(T,P1,R).

minsert([],E,[E]).
minsert([H|T],E,[E,H|T]).
minsert([H|T],E,[H|R1]):-minsert(T,E,R1).

perm([],[]).
perm([H|T],R):-
    perm(T,R1),
    minsert(R1,H,R).


comb(_,0,[]):-!.
comb([H|T],K,[H|R1]):-
    K1 is K-1,
    comb(T,K1,R1).
comb([_|T],K,R):-
    comb(T,K,R).


arr(L,K,R):-
    comb(L,K,R1),
    perm(R1,R).


