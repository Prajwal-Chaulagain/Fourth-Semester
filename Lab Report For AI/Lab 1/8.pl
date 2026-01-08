% Write a Prolog Program for Mahabharat.
% -------- Family Facts --------
father(shantaun, bhishma).
father(pandu, yudhishthira).
father(pandu, bheema).
father(pandu, arjuna).
father(pandu, nakula).
father(pandu, sahadeva).

father(dhritarashtra, duryodhana).
father(dhritarashtra, dushasana).

mother(kunti, yudhishthira).
mother(kunti, bheema).
mother(kunti, arjuna).
mother(madri, nakula).
mother(madri, sahadeva).

mother(gandhari, duryodhana).
mother(gandhari, dushasana).

% -------- Gender --------
male(bhishma).
male(pandu).
male(dhritarashtra).
male(yudhishthira).
male(bheema).
male(arjuna).
male(nakula).
male(sahadeva).
male(duryodhana).
male(dushasana).

female(kunti).
female(madri).
female(gandhari).

% -------- Rules --------
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).
