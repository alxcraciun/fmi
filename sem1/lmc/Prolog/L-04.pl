% *Pag 118

listaNelem(_,0,[]).
listaNelem(L,N,[H|T]) :- N > 0, P is N - 1, member(H,L), listaNelem(L,P,T).
listeNelem(L,N,LL) :- bagof(M, listaNelem(L,N,M), LL).

/*
?- listaNelem([1,2,3],2,X).
X = [1, 1] ;
X = [1, 2] ;
X = [1, 3] ;
X = [2, 1] ;
X = [2, 2] ;
X = [2, 3] ;
X = [3, 1] ;
X = [3, 2] ;
X = [3, 3] 
*/


/*

*Pag 120 - bagof/3, setof/3, findall/3

bagof/3
?- bagof((X,Y), (member(X,[1,2,2,2,3]),member(Y,[0,1,2,3,4,5]),X<Y),L).
?- bagof(X, (member(X,[1,2,2,2,3]),member(Y,[0,1,2,3,4,5]),X<Y),L).
?- bagof(X, Y^(member(X,[1,2,2,2,3]),member(Y,[0,1,2,3,4,5]),X<Y),L).


setof/3 - similar dar fara duplicate
?- setof((X,Y), (member(X,[1,2,2,2,3]),member(Y,[0,1,2,3,4,5]),X<Y),L).
?- setof(X, (member(X,[1,2,2,2,3]),member(Y,[0,1,2,3,4,5]),X<Y),L).
?- setof(X, Y^(member(X,[1,2,2,2,3]),member(Y,[0,1,2,3,4,5]),X<Y),L).


findall/3
?- findall(X,(member(X,[1,2,2,2,3]),member(Y,[0,1,2,3,4,5]),X<Y),L).
?- findall((X,Y),(member(X,[1,2,2,2,3]),member(Y,[0,1,2,3,4,5]),X<Y),L).

*/


% *Pag 124 - Crosswords

word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).
word(enhance,e,n,h,a,n,c,e).

crosswd(V1,V2,V3,H1,H2,H3) :-
    word(V1,_,A,_,B,_,C,_),
    word(V2,_,D,_,E,_,F,_),
    word(V3,_,G,_,H,_,I,_),
    word(H1,_,A,_,D,_,G,_),
    word(H2,_,B,_,E,_,H,_),
    word(H3,_,C,_,F,_,I,_).


% *Pag 126 - Labirint

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X,X,[X]).
path(X,Y,[X|L]) :- connected(X,Z), path(Z,Y,L).

pathc(X,Y) :- path(X,Y,_).

/* 
?- pathc(5,10).
?- path(5,10,L).
?- pathc(6,X).
?- path(6,X,L).
?- pathc(X,13).
*/


% *Pag 132 - Countdown
% find source file in Docs/words.pl/

% ! Predicat Predefinit
% atom_chars(Atom,CharList).

word_letters(X,Y) :- atom_chars(X,Y).

liminus([C|L],C,L).
liminus([D|L], C, [D|M]) :- D\==C, liminus(L,C,M).

cover([],_).
cover([H|T],L) :- liminus(L,H,M), cover(T,M).

solution(Letters, Word, Len) :- 
    word(Word), 
    word_letters(Word, WordLetters), 
    length(WordLetters, Len), 
    cover(WordLetters, Letters).

search_solution(_,'no solution', 0).
search_solution(ListLetters, Word, X) :- X > 0, solution(ListLetters, Word, X).
search_solution(ListLetters, Word, X) :- X > 0, not(solution(ListLetters,Word,X)), Y is X-1, search_solution(ListLetters,Word,Y).

topsolution(ListLetters, Word) :- length(ListLetters, MaxScore),  search_solution(ListLetters, Word, MaxScore).

/*
?- topsolution([r,d,i,o,m,t,a,p,v],Word).
Word = dioptra

?- word(Word), word_letters(Word,Letters), length(Letters,45).
Gaseste cuvinte in engleza cu 45 de litere

?- cover([a,e,i,o], [m,o,n,k,e,y,b,r,a,i,n]).
true

?- cover([e,e,l], [h,e,l,l,o]).
false

?- solution([g,i,g,c,n,o,a,s,t], Word, 3).
Word = act

?- topsolution([y,c,a,l,b,e,o,s,x], Word).
*/