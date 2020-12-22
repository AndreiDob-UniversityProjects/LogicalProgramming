par([_,_]).
par([_,_|T]):-par(T).

elim(L,0,L).
elim([H|T],N,R):-is_list(H),par(H),!,
    N1 is N-1,
    elim(T,N1,R).
elim([H|T],N,[H|R]):-elim(T,N,R).

sum([],0).
sum([H|T],R):-sum(T,R1),R is H+R1.


sub(_,[],0).
sub([H|T],[H|R],S):-S1 is S-H,sub(T,R,S1).
sub([_|T],R,S):-sub(T,R,S).

