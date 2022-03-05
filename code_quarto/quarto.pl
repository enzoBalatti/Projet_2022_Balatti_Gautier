:-include("predicatsQuarto.pl").
:-include("fonctionsQuarto.pl").
:-include("jeuIA.pl").
:-include("MinMaxQuarto.pl").


quarto():-initialisationPlateau(Plateau,PiecesDisponibles,PlacesOccupees),consignes(),
    writeln("entrez le nom du joueur 1 :"),read(Joueur1),atom_string(Joueur1,J1),
    writeln("entrez le nom du joueur 2 :"),read(Joueur2),atom_string(Joueur2,J2),

    writeln(J1),writeln(J2),nl,nl,nl,
    writeln("Quel mode de jeu que vous voulez faire ?"),nl,
    writeln("entrez 1 pour jouer à 2 sur le même ordinateur"),
    writeln("entrez 2 pour jouer contre une IA non jouant hasardeusement"),
   % read(Mode2Jeu),

    jeu(Plateau,PiecesDisponibles,PlacesOccupees,J1,J2).



jeu(Plateau,[],_,_,_):-not(gagne(Plateau)),writeln("egalite, vous avez placé tous les pions"),etatPlateau(Plateau),!.
jeu(Plateau,_,_,_,JoueurPassif):-gagne(Plateau),write("Bravo "),write(JoueurPassif),writeln("! Vous avez gagné la partie"),etatPlateau(Plateau),!.

jeu(Plateau,PiecesDisponibles,PlacesOccupees,JoueurCourant,JoueurPassif):-
    %on affiche l'etat du plateau :
    etatPlateau(Plateau),

    %on demande a l'utilisateur de choisir un pion
    write(JoueurPassif),writeln(" quel pion voulez vous que votre adversaire place parmi les suivants? N'oubliez pas de mettre un point a la fin de votre saisie"),
    afficherLigne(PiecesDisponibles),writeln(""),
    %on récupere ce qu'il a ecrit
    read(Pion),entrerPion(PiecesDisponibles,Pion,PionFinal),

    %le pion doit maintenant etre place
    write(JoueurCourant),writeln(" a quelle position voulez vous le placer?"),
    afficherLigne(PlacesOccupees),writeln(""),
    read(Position),entrerPlace(PlacesOccupees,Position,PositionFinale),
    %number(PositionFinale),

    placerPion(PositionFinale,PionFinal,Plateau,_,Res),
    retirer(PiecesDisponibles,PionFinal,_,PD1),
    ajouterElem(PositionFinale,PlacesOccupees,PO1),
    inverser(JoueurCourant,JoueurPassif,JC1,JP1),
    jeu(Res,PD1,PO1,JC1,JP1).





