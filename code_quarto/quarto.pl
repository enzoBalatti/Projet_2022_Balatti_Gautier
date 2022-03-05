:-include("fonctionsQuarto.pl").
%:-include("jeuIA.pl").
:-include("MinMaxQuarto.pl").


quarto():-initialisationPlateau(Plateau,PiecesDisponibles,PlacesOccupees),consignes(),
    writeln("entrez le nom du joueur 1 :"),read(Joueur1),atom_string(Joueur1,J1),
    writeln("entrez le nom du joueur 2 :"),read(Joueur2),atom_string(Joueur2,J2),

    writeln(J1),writeln(J2),nl,writeln("La partie va commencer") ,nl,

    jeu(Plateau,PiecesDisponibles,PlacesOccupees,J1,J2).



jeu(Plateau,[],_,_,_):-not(gagne(Plateau)),writeln("egalite, vous avez plac� tous les pions"),etatPlateau(Plateau),!.
jeu(Plateau,_,_,_,JoueurPassif):-gagne(Plateau),write("Bravo "),write(JoueurPassif),writeln("! Vous avez gagn� la partie"),etatPlateau(Plateau),!.

jeu(Plateau,PiecesDisponibles,PlacesOccupees,JoueurCourant,JoueurPassif):-
    %on affiche l'etat du plateau :
    afficherInfosPions(),nl,
    etatPlateau(Plateau),nl,

    %on demande a l'utilisateur de choisir un pion
    write(JoueurPassif),writeln(" quel pion voulez vous que votre adversaire place parmi les suivants? N'oubliez pas de mettre un point a la fin de votre saisie"),nl,

    write("Voici toutes les pi�ces disponibles "),afficherLigne(PiecesDisponibles),nl,nl,
    %on r�cupere ce qu'il a ecrit
    choixPion(Pion,JoueurPassif),entrerPion(PiecesDisponibles,Pion,PionFinal,JoueurPassif),
    write(JoueurPassif),write(" a choisi la pi�ce suivante : "),writeln(PionFinal),nl,

    %le pion doit maintenant etre place
    write(JoueurCourant),writeln(" a quelle position voulez vous le placer?"),nl,
    write("Voici les places d�j� occupees"),
    afficherLigne(PlacesOccupees),nl,nl,
    choixPosition(Position,JoueurCourant),entrerPlace(PlacesOccupees,Position,PositionFinale,JoueurCourant),
    writeln(PositionFinale),

    placerPion(PositionFinale,PionFinal,Plateau,_,Res),
    retirer(PiecesDisponibles,PionFinal,_,PD1),
    ajouterElem(PositionFinale,PlacesOccupees,PO1),
    inverser(JoueurCourant,JoueurPassif,JC1,JP1),
    jeu(Res,PD1,PO1,JC1,JP1).





