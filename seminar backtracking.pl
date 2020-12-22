%Se da o lista L. Sa se genereze lista tuturor aranjamentelor de k
% elemente care au produsul p si suma s
% avem: permutari,combinari,aranjamente
insert(E,[],[E]).
insert(E,[H|T],R):-R=[E,H|T].
insert(E,[H|T],R):-insert(E,T,R1),R=[H|R1].


perm([],[]).
perm([H|T],R):-perm(T,R1),insert(H,R1,R).
%nu merg
comb(0,_,[]).
comb(K,[_|T],R):-comb(K,T,R).
comb(K,[H|T],R):-K2 is K-1,comb(K2,T,R1),R=[H|R1].

aranj([],K,[]).
aranj(L,K,R):-comb(K,L,R1),perm(R1,R).
%num merg stop
%poza tel

%toate subseturile de lungime para far a numara cate sunt in lista
subset([],[]).
subset([H|T],R):-subset(T,R1),insert(H,R1,R).
subset([H|T],R):-subset(T,R).

subset2([],[]).
subset2([H|T],[H|R]):-subset2(T,R).
subset2([H|T],R):-subset2(T,R).

iseven([]).
iseven([_,_|T]):-iseven(T).

