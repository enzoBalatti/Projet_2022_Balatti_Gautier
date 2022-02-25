:-include("predicatsQuarto.pl").
:-include("fonctionsQuarto.pl").


quarto():-initialisationPlateau(Plateau,PiecesDisponibles,PlacesOccupees),consignes(),
    writeln("entrez le nom du joueur 1 :"),read(Joueur1),atom_string(Joueur1,J1),
    writeln("entrez le nom du joueur 2 :"),read(Joueur2),atom_string(Joueur2,J2),

    writeln(J1),writeln(J2),
    jeu(Plateau,PiecesDisponibles,PlacesOccupees,J1,J2).


inverser(A,B,B,A).

jeu(Plateau,[],_):-not(gagne(Plateau)),writeln("egalite, vous avez plac� tous les pions"),etatPlateau(Plateau),!.
jeu(Plateau,_,_,_,JoueurPassif):-gagne(Plateau),write("Bravo "),write(JoueurPassif),writeln("! Vous avez gagn� la partie"),etatPlateau(Plateau),!.

jeu(Plateau,PiecesDisponibles,PlacesOccupees,JoueurCourant,JoueurPassif):-
    %on affiche l'etat du plateau :
    etatPlateau(Plateau),

    %on demande a l'utilisateur de choisir un pion
    write(JoueurPassif),writeln(" quel pion voulez vous que votre adversaire place parmi les suivants? N'oubliez pas de mettre un point a la fin de votre saisie"),
    afficherLigne(PiecesDisponibles),writeln(""),
    %on r�cupere ce qu'il a ecrit
    read(Pion),pionDisponible(Pion,PiecesDisponibles,PionFinal),

    %le pion doit maintenant etre place
    write(JoueurCourant),writeln(" a quelle position voulez vous le placer?"),
    afficherLigne(PlacesOccupees),writeln(""),
    %read(Position),placeDisponible(Position,PlacesOccupees,PositionFinale),
    %number(PositionFinale),
    read(PositionFinale),
    fonction(Plateau,PositionFinale,PionFinal,Res),

    %placerPion(PositionFinale,PionFinal,Plateau,_,Res),
    retirer(PiecesDisponibles,PionFinal,_,PD1),
    ajouterElem(PositionFinale,PlacesOccupees,PO1),
    inverser(JoueurCourant,JoueurPassif,JC1,JP1),
    jeu(Res,PD1,PO1,JC1,JP1).



