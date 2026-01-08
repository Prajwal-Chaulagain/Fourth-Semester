% Write a Prolog Program for Medical diagnosis.

% Facts
symptom(flu, fever).
symptom(flu, cough).
symptom(flu, headache).

symptom(cold, cough).
symptom(cold, sneezing).
symptom(cold, sore_throat).

% Rule
diagnosis(Disease) :-
    symptom(Disease, Symptom1),
    write('Do you have '), write(Symptom1), write('? (yes/no) '),
    read(yes),
    symptom(Disease, Symptom2),
    Symptom2 \= Symptom1,
    write('Do you have '), write(Symptom2), write('? (yes/no) '),
    read(yes). 

