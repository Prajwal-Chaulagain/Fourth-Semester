% Write a Prolog Program for Multiplication table.
mulTable(N, End) :- 
    mulTable(N, 1, End).   
 
mulTable(_, Start, End) :- 
    Start > End.            
 
mulTable(N, Counter, End) :- 
    Counter =< End,                            % Ensure we haven't reached the limit 
    write(N), write('X'), write(Counter),      % Print "N X Counter" 
    write('='),  
    Mul is N * Counter, write(Mul), nl,        % Calculate and print result 
    NewCounter is Counter + 1,                 % Move to next number 
    mulTable(N, NewCounter, End).              % Recursive call