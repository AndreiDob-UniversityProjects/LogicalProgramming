%rem(L:list,R:list)
%flow model rem(i,o)
rem([X],X).
rem([A,B],[]):-N is B-A,N=:=1.
rem([A,B],[A,B]):-N is B-A,N=\=1.
rem([H1,H2,H3|T],R):-N1 is H2-H1,N1=:=1, N2 is H3-H2,N2=\=1,
    rem([H3|T],R).
rem([H1,H2,H3|T],R):-N1 is H2-H1,N1=:=1, N2 is H3-H2,N2=:=1,
    rem([H2,H3|T],R).
rem([H1,H2,H3|T],R):-N1 is H2-H1,N1=\=1,
    rem([H2,H3|T],R1),
    islist(R1),
    R=[H1|R1].
rem([H1,H2,H3|T],R):-N1 is H2-H1,N1=\=1,
    rem([H2,H3|T],R1),
    not( islist(R1)),
    R=[H1,R1].

%islist(A:anything)
%flow model: islist(i)
islist([_|_]).
islist([]).


