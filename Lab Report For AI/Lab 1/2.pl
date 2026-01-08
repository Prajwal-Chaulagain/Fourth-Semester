% Write a Prolog Program for Friends of Friends.
% Facts
friend(madhav, prajwal).
friend(prajwal, anil).
friend(prajwal, roman).
friend(anil, bibek).
friend(roman, luv).

% Friendship is symmetric
is_friend(X, Y) :- friend(X, Y).
is_friend(X, Y) :- friend(Y, X).

% Friends of Friends rule
friend_of_friend(X, Y) :-
    is_friend(X, Z),
    is_friend(Z, Y),
    X \= Y,
    \+ is_friend(X, Y).  

