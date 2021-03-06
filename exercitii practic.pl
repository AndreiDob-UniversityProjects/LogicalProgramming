src(E,[H|_]):-E=:=H,!.
src(E,[_|T]):-src(E,T).

maxi([H1],H1).
maxi([H1,H2|T],R):-H1>H2,maxi([H1|T],R).
maxi([H1,H2|T],R):-H1=<H2,maxi([H2|T],R).


mini([H1],H1).
mini([H1,H2|T],R):-H1<H2,mini([H1|T],R).
mini([H1,H2|T],R):-H1>=H2,mini([H2|T],R).



%removes el E from List(all of them)
rem([],_,[]).
rem([H|T],E,R):-H=:=E,rem(T,E,R1), R=R1.
rem([H|T],E,R):-H=\=E,rem(T,E,R1), R=[H|R1].

%deletes first occurence of E in List
del(_,[],[]).
del(E,[H|T],R):-E=:=H,!,R=T.
del(E,[H|T],R):-del(E,T,R1),R=[H|R1].

%creates list of elements in interval [S,E]
crel(E,E,[E]).
crel(S,E,R):-S<E,S2 is S+1,crel(S2,E,R1),R=[S|R1].

even_no([_,_]):-!.
even_no([_,_|T]):-even_no(T).

gcd(A,B,B):-A=:=B.
gcd(A,B,R):-A>B,A2 is A-B,gcd(A2,B,R).
gcd(A,B,R):-B>A,B2 is B-A,gcd(A,B2,R).

%sorts list descending and remove duplicates
sortList([],[]):-!.
sortList(L,R):-
    mini(L,MIN),
    rem(L,MIN,LR),
    sortList(LR,R1),
    R=[MIN|R1].

%sorts list descending whithout removing duplicates
sortList2([],[]):-!.
sortList2(L,R):-
    mini(L,MIN),
    del(MIN,L,LR),
    sortList2(LR,R1),
    R=[MIN|R1].


mergeLists([],L,L):-!.
mergeLists(L,[],L):-!.
mergeLists([H1|T1],[H2|T2],[H1,H2|R1]):-H1<H2,
    mergeLists(T1,T2,R1).
mergeLists([H1|T1],[H2|T2],[H2,H1|R1]):-H1>=H2,
    mergeLists(T1,T2,R1).

%ret the list of pos where E is located in List
%P starts form 1 :)
listOfPositions([],_,_,[]).
listOfPositions([H|T],P,E,R):-H=:=E,
    P1 is P+1,
    listOfPositions(T,P1,E,R1),
    R=[P|R1].
listOfPositions([H|T],P,E,R):-H=\=E,
    P1 is P+1,
    listOfPositions(T,P1,E,R).


hasdivisor(N,D):- M is N mod D, M =:=0.
hasdivisor(N,D):- M is N mod D, M =\=0,D<N,
    D1 is D+1,hasdivisor(N,D1).

isprime(2):-!.
isprime(N):-not(hasdivisor(N,2)).

