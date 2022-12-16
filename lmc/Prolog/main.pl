% Comentariu 
% Orice lista se imparte in [Head | Tail]

% Dupa toate compenzile trebuie sa pui . 

% append([1], [2], R)   ->  R = [1,2].

% [H|[]] <=> [H]
% append(lista1, lista2, lista_rezultat)

% _ -> indiferent care este elementul

listN([], 0).
listN([a|T], N) :- N > 0, M is N-1, listN(T,M).

rev([],[]).
rev([H|T],L) :- rev(T,N), append(N,[H],L).

reva(L,R) :- revah(L,[],R).
revah([], R, R).
revah([H|T], S, N) :- revah(T,[H|S],N).

revd(L,R) :- revdh(L,(R,[])).
revdh([],(R,R)).
revdh([H|T],(N,S)) :- revdh(T,(N,[H|S])).

% Conteaza ordinea, prima 

flatten([], []).
flatten([X|T], [X|R]) :- not(is_list(X)), flatten(T, R).
flatten([[]|T], R) :- flatten(T, R).
flatten([X|T], Z) :- flatten(X, R1), flatten(T, R2), append(R1, R2, Z).

