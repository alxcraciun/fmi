% ! Metapredicatul listing/1
% listing(listN) - afiseaza toate clauzele

% *Pag 151
% Inversarea Listelor

listN([],0).
listN([a|T], N) :- N > 0, M is N - 1, listN(T,M).

% rev([],[]).
% rev([H|T],L) :- rev(T,N), append(N,[H],L).

reva(L,R) :- revah(L,[],R).
revah([], R, R).
revah([H|T], S, N) :- revah(T,[H|S],N).

revd(L,R) :- revdh(L,(R,[])).
revdh([],(R,R)).
revdh([H|T],(N,S)) :- revdh(T,(N,[H|S])).


% *Pag 154
% Flattening Lists

% Folosind append/3
flatten([],[]).
flatten([H|T],[H|R]) :- not(is_list(H)), flatten(T,R).
flatten([H|T], R) :- is_list(H), flatten(H,X), flatten(T,Y), append(X,Y,R).

% Folosind Difflists
flattend(L,R) :- flattendh(L,(R,[])).
flattendh([],(R,R)).
flattendh([H|T], ([H|R],S)) :- not(is_list(H)), flattendh(T,(R,S)).
flattendh([H|T],(R,S)) :- is_list(H), flattendh(H,(R,N)), flattendh(T,(N,S)).

% ?- flatten([1,2,[3,a],[[7],2],5],L).
% L = [1, 2, 3, a, 7, 2, 5]


% *Pag 155
% Quicksort w. Difflists

split( ,[],[],[]).
split(X,[H|T],[H|A],B) :- H < X, split(X,T,A,B).
split(X,[H|T],A,[H|B]) :- H >= X, split(X,T,A,B).

quicksortd(L,R) :- quicksortdh(L,(R,[])).
quicksortdh([],(R,R)).
quicksortdh([H|T],(R,S)) :-
    split(H,T,A,B),
    quicksortdh(A,(R,[H|N])),
    quicksortdh(B,(N,S)).