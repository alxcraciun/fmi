/* 
! Predicate Definite

is /2
=:= /2
=\= /2
< /2
<= /2
> /2
>= /2
** /2

min/2
abs/1
sqrt/1
sin/1

length/2 = lungimea in al doilea arg
member/2 = daca arg1 se afla in lista arg2
append/3 = identic cu predicatul concat_lists
last/2 = daca arg2 identic cu ultimul elem al listei arg1
reverse/2 = pune inversul listei din arg1 in arg2 

*/

% *Pag 80

% ?- 3+5 = +(3,5).
% true

% ?- 3+5 = +(5,3).
% false

% ?- 3+5 = 8
% false

% ?- 3+5 is 8
% false

% ?- X is 3+5
% X = 8


% *Pag 88 - Aritmetica

distance( (Xa, Ya), (Xb, Yb), X ) :- X is sqrt( (Xa-Xb)**2 + (Ya-Yb)**2 ).

% ?- distance((0,0), (3,4), X).
% X = 5.0

% ?- distance((-2.5,1), (3.5,-4), X).
% X = 7.810249675906654


% *Pag 90 - Recursivitate

parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, dony).
parent(mary, sandra).

ancestor_of(X, Y) :- parent(X, Y).
ancestor_of(X, Y) :- parent(X, Z), ancestor_of(Z, Y).


% *Pag 92 - Fibonacci

/*

Stack limit exceeded

fib(0, 1).
fib(1, 1).
fib(N, X) :- N >= 2, M is N-1, fib(M, Y), P is N-2, fib(P, Z), X is Y + Z.

*/

fibo(0, 0, 1).
fibo(1, 1, 1).
fibo(N, Z, X) :- N >= 2, M is N-1, fibo(M,Y,Z), X is Y + Z.

fib(N,X) :- fibo(N,_,X).


% *Pag 94 - Afisari

% ?- write('Hello World!'), nl
% Hello World

% ?- X = hello, write(X), nl
% hello
% X = hello


% *Pag 95 - Afisare Patrat

line(0,_).
line(X,C):- X > 0, Y is X-1, write(C), write(' '), line(Y,C).

rectangle(0,_,_) :- nl.
rectangle(X, Z, C) :- X>0, Y is X-1, line(Z,C), nl, rectangle(Y,Z,C).

square(X, C) :- rectangle(X, X, C).


% *Pag 98 - Liste

% ?- [1,2,3,4,5] = [Head | Tail]
% Head = 1
% Tail = [2,3,4,5]


% Al doilea element dintr-o lista
% ?- [quod, licet, jovi, non, licet, bovi] = [_, X | _].
% X = licet

element_of(X, [X | _]).
element_of(X, [_ | Tail]) :- element_of(X, Tail).

% ?- element_of(a,[a,b,c]).
% ?- element_of(X,[a,b,c]).


concat_lists([], List, List).
concat_lists([Elem | List1], List2, [Elem | List3]) :- concat_lists(List1, List2, List3).

% ?- concat_lists([1, 2, 3], [d, e, f, g], X).
% ?- concat_lists(X, Y, [a, b, c, d]).


% *Pag 102
% Transforma din a in b

all_a([]).
all_a([a | List]) :- all_a(List).

trans_a_b([], []).
trans_a_b([a|X],[b|Y]) :- trans_a_b(X,Y).

% ?- trans_a_b( [a,a,a], L ).
% L = [b, b, b].

% ?- trans_a_b( [a,a,a], [b] ).
% false.

% ?- trans_a_b( L, [b,b] ).
% L = [a, a].


% *Pag 103
% Produsul Scalar al unei liste cu un element

scalarMult(_,[], []).
scalarMult(X, [H|T], [R|RT]) :- R is X * H, scalarMult(X, T, RT).

% ?- scalarMult(3,[2,7,4], Result).
% Result = [6,21,12].


% *Pag 104
% Produsul scalar a doua liste

dot([], [], 0).
dot([H1|T1], [H2|T2], Result) :- dot(T1, T2, Aux), Result is Aux + H1 * H2. 

% ?- dot([2,5,6],[3,4,1],Result).
% Result = 32


% *Pag 105
% Maximul dintr-o lista

max([],0).
max([H|T],Y) :- max(T,Y), Y >= H.
max([H|T],H) :- max(T,Y), H > Y.


% ?-max([4,2,6,8,1],Result).
% Result = 8


