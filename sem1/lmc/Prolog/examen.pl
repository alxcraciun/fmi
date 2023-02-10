% 2_134_Craciun_Alexandru.pl

% H1, H2 primele 2 elemente din lista
% Verific daca respecta conditia folosind =:= 
% Am tratat separat cazurile in care lista are 0 / 1 element

consec([]).
consec([_]).
consec([H1|[H2|T]]) :- X is H1, Y is H2, X =:= Y+1,  consec(T).

/*

?- consec([5,4,3,2,1]).
true

?- consec([6,5,4,2,1]).
false

?- consec([1,2,3]).
false

?- consec([3,1]).
true

*/ 

% Transform student() intr-o structura lista de formatul [Nume, Nota] folosind transform()
% Folosind cele doua variabile, dupa unificare, verific daca Nota este < sau >= decat pragul
% In functie de cazul pe care ma aflu decid daca sa adaug atomul Nume la lista Rezultat (arg3).

% Problema e la functia transform() caci Nota este numar si nu pot apela atom() pe el

transform(V,[V]) :- atom(V).
transform(student(X,Y), Lista) :- transform(X,T), transform(Y,U), union(T,U, Lista).

listare_studenti([], _, []).

% listare_studenti([H|T], Prag, [R|RT] :- transform(H, [Elev|[Nota|VID]]), Nota < Prag, listare_studenti(T, Prag, [Elev|[R|RT]]).
% listare_studenti([H|T], Prag, [R|RT] :- transform(H, [Elev|[Nota|VID]]), Nota >= Prag, listare_studenti(T, Prag, [R|RT]).





/*

?- listare_studenti([student(ionel, 8), student(maria, 10), student(gabriela, 5), student(luca, 9)], 9, R).
R = [ionel, gabriela]

?- listare_studenti([student(marcel, 9)], 9, R).
R = []

?- listare_studenti([student(marcel, 3), student(ion, 4)], 5, R).
R = [marcel, ion]

*/