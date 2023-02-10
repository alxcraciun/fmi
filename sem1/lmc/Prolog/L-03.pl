% *Pag 109
% Verifica daca lista este palindrom

rev([],[]).
rev([H|T], L) :- rev(T,N), append(N,[H],L).

palindrome(L) :- rev(L,L).

% ?- palindrome([r,e,d,i,v,i,d,e,r]).
% true


% *Pag 110
% Sterge duplicatele dintr-o lista

remove_duplicates([],[]).
remove_duplicates([H|L],M) :- remove_duplicates(L,M), member(H,M).
remove_duplicates([H|L],[H|M]) :- remove_duplicates(L,M), not(member(H,M)).

% ?- remove duplicates([a, b, a, c, d, d], List).
% List = [b, a, c, d].


% *Pag 111
% Daca arg1 apare in lista arg2 de arg3 ori

atimes(_,[],0).
atimes(N,[N|T],X) :- atimes(N,T,Y), X is Y + 1.
atimes(N,[H|T],X) :- atimes(N,T,X), N \== H.


/*

?- atimes(3,[3,1,2,1],X).
X = 1

?- atimes(1,[3,1,2,1],X).
X = 2

?- atimes(N,[3,1,2,1],2).
N = 1

?- atimes(N,[3,1,2,1],1).
N = 3 ;
N = 2

?- atimes(N,[3,1,2,1],0).
true

?- atimes(N,[3,1,2,1],X).
N = 3, X = 1 ;
N = 1, X = 2 ;
N = 2, X = 1 ;
X = 0

*/


% *Pag 113
% Algoritm Insertion Sort

insert(X,[],[X]).
insert(X,[H|T],[X|[H|T]]) :- X < H.
insert(X,[H|T],[H|L]) :- X >= H, insert(X,T,L).

insertsort([],[]).
insertsort([H|T],L) :- insertsort(T,L1), insert(H,L1,L).


% *Pag 114
% Algoritm QuickSort

split(_,[],[],[]).
split(X,[H|T],[H|A],B) :- H < X, split(X,T,A,B).
split(X,[H|T],A,[H|B]) :- H >= X, split(X,T,A,B).

quicksort([],[]).
quicksort([H|T],L) :-
    split(H,T,A,B), 
    quicksort(A,M), 
    quicksort(B,N),
    append(M,[H|N],L).
    