/* 
non() = NOT 
si() = AND
sau() = OR
imp() = IMPLIES
*/

% *Pag 142
% Arg1 = Formula
% Arg2 = Multimea var din formula

vars(V,[V]) :- atom(V).
vars(non(X),S) :- vars(X,S).
vars(si(X,Y),S) :- vars(X,T), vars(Y,U), union(T,U,S).
vars(sau(X,Y),S) :- vars(X,T), vars(Y,U), union(T,U,S).
vars(imp(X,Y),S) :- vars(X,T), vars(Y,U), union(T,U,S).

% ?- vars(imp(non(a),imp(a,b)),S).
% S = [a, b]


% *Pag 143

val(V, [(V,A)|_], A).
val(V, [_|T], A) :- val(V, T, A).

% Solutie Alternativa
% val(V,E,A) :- member((V,A),E).

% ?- val(b,[(a,1),(b,0)],A).
% A = 0


% *Pag 144

bnon(0,1). bnon(1,0).
bsi(0,0,0). bsi(0,1,0). bsi(1,0,0). bsi(1,1,1).
bsau(0,0,0). bsau(0,1,1). bsau(1,0,1). bsau(1,1,1).

% X -> Y = (non X) sau Y
bimp(X,Y,Z) :- bnon(X,NX), bsau(NX,Y,Z).

% ?- bsi(1,0,C).
% C = 0

% ?- bimp(A,0,0).
% A = 1

% ?- bimp(0,B,0).
% false


% *Pag 145

eval(V,E,A) :- atom(V), val(V,E,A).
eval(non(X),E,A) :- eval(X,E,B), bnon(B,A).
eval(si(X,Y),E,A) :- eval(X,E,B), eval(Y,E,C), bsi(B,C,A).
eval(sau(X,Y),E,A) :- eval(X,E,B), eval(Y,E,C), bsau(B,C,A).
eval(imp(X,Y),E,A) :- eval(X,E,B), eval(Y,E,C), bimp(B,C,A).

% ?- eval(imp(b,d),[(a,1), (b,0), (d,1)],A).
% A = 1

% ?- eval(imp(d,b),[(a,1), (b,0), (d,1)],A).
% A = 0


% *Pag 146

evals(_,[],[]).
evals(X,[E|Es],[A|As]) :- eval(X,E,A), evals(X,Es,As).

% ?- evals(imp(d,b),[[(a,1), (b,0), (d,1)], [(a,1), (b,1), (d,0)]], As).
% As = [0, 1]


% *Pag 147

evs([],[[]]).
evs([V|T],Es) :- evs(T,Esp), adauga(V,Esp,Es).
adauga(_,[],[]).
adauga(V,[E|T], [[(V,0)|E],[(V,1)|E]|Es]) :- adauga(V,T,Es).

% ?- evs([c,b],Es).
% Es = [[(c,0), (b,0)], [(c,1), (b,0)], [(c,0), (b,1)], [(c,1), (b,1)]


% *Pag 148

all_evals(X,As) :- vars(X,S), evs(S,Es), evals(X,Es,As).

% ?- all evals(imp(a,a),As).
% As = [1, 1]

% ?- all evals(imp(a,b),As).
% As = [1, 0, 1, 1]


% *Pag 149

all_ones([]).
all_ones([1|T]) :- all_ones(T).
taut(X) :- all_evals(X,As), all_ones(As).

% ?- taut(imp(a,a)).
% true

% ?- taut(imp(a,b)).
% false


