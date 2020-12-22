%flow model (i,i,o)
%subsetsum(SET:List,SUM:int,ANSWER:List)
subsetsum(SET, SUM, ANSWER) :-
    subset(SET, ANSWER),
    sum(ANSWER, SUM).

%sum(L:list,SUM:int)-sums element of the list
%flow model (i,o)
sum([], 0).
sum([X | T], SUM) :-
    sum(T, TAILSUM),
    SUM is TAILSUM + X.

%flow model (i,o)
%subset - finds subsets
subset([], []).
%primul element si subseturile restului de elemente
subset([E|T], [E|NT]) :-
    subset(T, NT).
%doar subseturile restului de elemente
subset([_|T], NT) :-
    subset(T, NT).

%flow model (i,i,o)
makeList(N,N,[]).
makeList(N,T,R):-N>T,
    T1 is T+1,
    makeList(N,T1,R1),
    R=[T|R1].

%flow model (i,o)
decomposition(N,R):-
    makeList(N,1,R1),
    subsetsum(R1,N,R).
