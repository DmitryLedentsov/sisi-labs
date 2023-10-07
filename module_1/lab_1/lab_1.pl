family('Saliery').
gangster('Tommy Angelo').
gangster('Sam').
gangster('Frank Coletti').
gangster('Paulle').

gangster('Ralph').
gangster('Luigi').
gangster('Big Buff').
gangster('Salvatore').
gangster('Big Stan').
gangster('Lucas').

chief('Ennio Saliery', 'Sam').
chief('Ennio Saliery', 'Frank Coletti').

chief('Sam', 'Tommy Angelo').
chief('Sam', 'Paulle').

chief('Tommy Angelo', 'Ralph').
chief('Tommy Angelo', 'Luigi').
chief('Tommy Angelo', 'Big Buff').

chief('Paulle','Salvatore').
chief('Paulle','Big Stan').
chief('Paulle','Lucas').

chief('Paulle', 'The Doctor').
consigliere('Frank Coletti').

boss('Ennio Saliery').
family_member('Ennio Saliery', 'Saliery').

%все подчиненные пахана автоматически принадлежат семье которой он руководит.

family('Marcano').
gangster('Sal Markano').
gangster('Georgi Marcano').
gangster('Nino Santangelo').
gangster('Luo Marcano').
gangster('Olivia  Marcano').

gangster('Tony Derazio').
gangster('Jimmy Cavar').
gangster('Pete Santini').
gangster('Andy Turetto').

chief('Sal Marcano', 'Georgi Marcano').
chief('Sal Marcano', 'Nino Santangelo').

chief('Georgi Marcano', 'Luo Marcano').
chief('Georgi Marcano', 'Olivia Marcano').

chief('Luo Marcano', 'Tony Derazio').
chief('Luo Marcano', 'Jimmy Cavar').

chief('Olivia Marcano','Pete Santini').
chief('Olivia Marcano','Andy Turetto').

consigliere('Nino Santangelo').
boss('Sal Marcano').
family_member('Sal Marcano', 'Marcano').

%рекурсивный поиск самого главного пахана
commander(X,Y):-
    chief(X,Y).

commander(X,Y):-
    chief(X,Z), commander(Z,Y).

%если пахан-член семьи, то и шестерка тоже
family_member(X, F):-
    family(F), commander(C,X), boss(C), family_member(C,F).

underboss(X):-
    gangster(X), not(consigliere(X)), boss(Y), chief(Y,X).

capo(X):-
    gangster(X), underboss(Y), chief(Y,X).

soldier(X):-
    gangster(X), capo(Y), chief(Y,X).

family_count(F, Count):-
    findall(M, family_member(M, F), List), length(List, Count).

assosiate(P):-
    family_member(P, _), not(gangster(P)).

enemy(X, Y):-
    gangster(X), gangster(Y), family_member(X, FX), family_member(Y, FY), FX\=FY.
