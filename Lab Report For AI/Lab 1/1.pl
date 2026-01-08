% Write a Prolog Program for Family relationship.

%facts
father(madhav, prajwal).
father(madhav, rita).

mother(sita, prajwal).
mother(sita, rita).

male(madhav).
male(prajwal).

female(sita).
female(rita).

%Rules
parent(X,Y):-father(X,Y).
parent(X,Y):-mother(X,Y).
sibling(X,Y):-parent(Z,X), parent(Z,Y), X \= Y.
brother(X,Y):-male(X), sibling(X,Y).
sister(X,Y):-female(X), sibling(X,Y).

