%  notGoal :- Goal, !, fail  <=>  \+ Goal

female(john).
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

/*
father_of(F,C) :- male(F), parent(F, C)
mother_of(M, C) :- female(M), parent(M, C)
grandfather_of(GF, C) :- father_of(GF, P), parent(P, C)
grandmother_of(GM, C) :- female(GF), parent(GF, Person), parent(Person, C)
sister_of(Sister, Person) :- female(Sister), parent(Parent, Sister), parent(Parent, Person)
*/