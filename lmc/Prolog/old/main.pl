% Primul element din lista [ X | ]
% Al doilea element din lista [ _ , X | _]

/* Verific daca am a sau b

all_a([]).
all_a([a|X]) :- all_a(X).

all_ab([]).
all_ab([a,b|X]) :- all_ab(X).

all_aSaub([]).
all_aSaub([a|X]) :- all_a(X).
all_aSaub([b|X]) :- all_a(X).

*/

/* Transform a in b

trans_a_b([],[]).
trans_a_b([a|X], [b|Y]) :- trans_a_b(X,Y).

trans_a_b2([],[]).
trans_a_b2([a|X], [b|Y]) :- trans_a_b2(X,Y).
trans_a_b2([C|X], [C|Y]) :- trans_a_b2(X,Y).

*/

/*

    ?-scalarMult(3,[2,7,4],Result).

scalarMult2(_,[],[]).
scalarMult2(N, [H|T], [N*H|Y]) :- scalarMult2(N,T,Y).

scalarMult(_,[],[]).
scalarMult(N,[H|T],[X|Y]) :- X is N*H, scalarMult(N,T,Y).

*/

% ?-dot([2,5,6],[3,4,1],Result).

dot([],[],0).
dot([H1|T1],[H2|T2], R) :- dot(T1, T2, Y) , R is Y + H1*H2.



% ?-max([4,2,6,8,1],Result).

max([], 0).
max([H|T],Y) :- max(T,Y), Y >= H.
max([H|T],H) :- max(T,Y), H > Y.

% trace. + ENTER