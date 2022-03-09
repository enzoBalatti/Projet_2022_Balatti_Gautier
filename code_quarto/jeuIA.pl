:-include("fonctionsQuarto.pl").
:-include("predicatsQuarto").


soustraireList([],_,ListeRetour,ListeRetour1):-reverse(ListeRetour,ListeRetour1),!.
soustraireList([T1|Q1],L2,ListeRetour,ListeRetour1):-
    member(T1,L2),
    soustraireList(Q1,L2,ListeRetour,ListeRetour1),!.
soustraireList([T1|Q1],L2,ListeRetour,ListeRetour1):-
    soustraireList(Q1,L2,[T1|ListeRetour],ListeRetour1),!.


partieGagne1Coup(_,[],_):-write(1),!.

partieGagne1Coup(Piece,[T|_],Grille):-
    placerPion(T,Piece,Grille,_,NewGrille),
    gagne(NewGrille),write(T),!.

partieGagne1Coup(Piece,[T|Q],Grille):-
    placerPion(T,Piece,Grille,_,NewGrille),
    not(gagne(NewGrille)),!,
    partieGagne1Coup(Piece,Q,Grille),!.







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






