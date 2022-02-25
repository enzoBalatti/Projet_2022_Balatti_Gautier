:-use_module(library(random)).

genereNombreAleatoire(Random):-random_between(1,16,Random).

jeuAleatoireIA(Piece,Position):-
    genereNombreAleatoire(Random1),
    genereNombreAleatoire(Random2),
    Piece=Random1,
    Position=Random2.
coucou():-write('coucou').
