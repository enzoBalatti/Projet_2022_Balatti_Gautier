:-include("fonctionsQuarto.pl").

partieGagne1Coup(_,[],_,_):-false.

partieGagne1Coup(Piece,[T|_],Grille,T):-
    placerPion(T,Piece,Grille,_,NewGrille),
    gagne(NewGrille),!.

partieGagne1Coup(Piece,[_|Q],Grille,Position):-
    partieGagne1Coup(Piece,Q,Grille,Position).






test(Piece,Grille,Compteur,PlacesOccupees):-repeat,
    genereNombreAleatoire(Random),
    not(memberchk(Random,PlacesOccupees)),
    placerPion(Random,Piece,Grille,_,NewGrille),
    gagne(NewGrille),
    Compteur<50,
    abort.





plusDe3Elem("-","-",_,_):-false,!.
plusDe3Elem("-",_,"-",_):-false,!.
plusDe3Elem("-",_,_,"-"):-false,!.
plusDe3Elem(_,"-","-",_):-false,!.
plusDe3Elem(_,"-",_,"-"):-false,!.
plusDe3Elem(_,_,"-","-"):-false,!.
plusDe3Elem("-","-","-",_):-false,!.
plusDe3Elem("-","-",_,"-"):-false,!.
plusDe3Elem("-",_,"-","-"):-false,!.
plusDe3Elem(_,"-","-","-"):-false,!.
plusDe3Elem("-","-","-","-"):-false,!.
plusDe3Elem(A,B,C,D):-ligne(A,B,C,D),!.






