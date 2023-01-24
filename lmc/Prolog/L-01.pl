/* 
! Comenzi Prolog
swipl main.pl 

Other ways to add source file
?- [file_name].
?- [’...cale.../nume.pl’].
?- consult(’...cale../nume.pl’).

Reload current source file
?- make.

Close swipl terminal
?- halt.

Debugging answers
?- trace.

Show all variations
?- w

Check next unification
?- ; 

Stop current search
?- CTRL+C

! Predicate definite

not/1 - not-ul expresiei
atom/1 - verifica daca e atom
var/1 - verifica daca e variabila
*/


% Regulile au Head :- Body
% Fapte = regulile fara body

% Virgula intre body-uri este conjunctie (AND)
% Regulile cu acelasi head sunt disjunctii (OR)


% *Pag 11

windy :- oslo.
norway :- oslo.
cold :- norway.
winterIsComing :- windy, cold.
oslo.
% ?- winterIsComing.
% true


% *Pag 27

foo(a).
foo(b).
foo(c).
% foo(X).


% *Pag 37

bar(b).
bar(c).
baz(c).
% ?- bar(X), baz(X).
% true

/*
bar(c).
bar(b).
baz(c).
% ?- bar(X), baz(X).
% X = c ;
% false
*/


% *Pag 41

culoare(albastru).
culoare(rosu).
culoare(verde).
culoare(galben).

harta(RO, SE, MD, UA, BG, HU) :- 
vecin(RO, SE), 
vecin(RO, UA), 
vecin(RO, MD), 
vecin(RO, BG), 
vecin(RO, HU), 
vecin(UA, MD), 
vecin(BG, SE), 
vecin(SE, HU).

vecin(X,Y) :- culoare(X), culoare(Y), X \== Y.


% *Pag 52 - Compararea termenilor

/*

T = U       reuseste daca exista o potrivire (se unifica)
T \= U      reuseste daca nu exista o potrivire (nu se unifica)
T == U      reuseste daca termenii sunt identici
T \== U     reuseste daca termenii sunt diferiti
T =:= 1+1   forteaza evaluarea de la 1+1

?- X = Y.
X = Y.

?- X == Y.
false

?- p(X,q(Z)) = p(Y,X).
X = Y, 
Y = q(Z).

?- p(X,Y) == p(X,Y).
true

?- 2 = 1 + 1
false

?- 2 == 1 + 1
false

?- 2 =:= 1+1
true

*/


% *Pag 53 - Negarea Predicatelor
% Mai multe referinte la pagina 71

animal(dog).
animal(elephant).
animal(sheep).

% ?- animat(cat).
% false

% ?- \+ animal(cat).
% true


% *Pag 57

married(peter, lucy).
married(paul, mary).
married(bob, juliet).
married(harry, geraldine).

single(Person) :- \+ married(Person, _), \+ married(_, Person).

% ?- single(mary). 
% false 

% ?- single(anne). 
% true 

% ?- single(X).
% false


% *Pag 59 

bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(donkey, monkey).

is_bigger(X, Y) :- bigger(X, Y).
is_bigger(X, Y) :- bigger(X, Z), is_bigger(Z, Y).

% Ele pot fi si unite (dar nu este totdeauna recomanda)
% is_bigger(X, Y) :- bigger(X, Y); bigger(X, Z), is_bigger(Z, Y).

is_smaller(X, Y) :- is_bigger(Y, X).


% *Pag 70

% f si 'Hello' = atomi
% A, Paul, _ , _abc = variabile


% *Pag 71

female(mary).
female(sandra).
female(juliet).
female(lisa).
male(peter).
male(paul).
male(dony).
male(bob).
male(harry).
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

father_of(F, C) :- male(F), parent(F, C).
mother_of(M, C) :- female(M), parent(M, C).

grandfather_of(GF, C) :- father_of(GF, P), parent(P, C).
grandmother_of(GM, C) :- mother_of(GM, P), parent(P, C).

sister_of(S, P) :- female(S), parent(Q, S), parent(Q, P), P \= S.
brother_of(B, P) :- male(B), parent(Q, B), parent(Q, P), B \= P.

aunt_of(A, P) :- sister_of(A, Q), parent(Q, P).
uncle_of(U, P) :- brother_of(U, Q), parent(Q, P).

% not_parent(X, Y) :- not(parent(X, Y)).
% not_parent(X, Y) :- \+ parent(X, Y).

% ?- not_parent(bob, juliet).
% true

% ?- not_parent(X, juliet).
% true

% ?- not_parent(X, Y).
% false


% Corectarea predicatului
not_parent(X,Y) :- 
    (male(X); female(X)), 
    (male(Y); female(Y)), 
    X \= Y, 
    not(parent(X,Y)).
