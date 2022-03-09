<<<<<<< HEAD
retirer([],_,L,L1):-reverse(L,L1).%permet de retirer un element d'une liste
=======
:-use_module(library(random)).

genereNombreAleatoire(Random):-random_between(1,16,Random).

choixPosition(Position,"ia"):-
    genereNombreAleatoire(Random),
    Position=Random,!.
choixPosition(Position,_):-
    read(Position).
choixPion(Pion,"ia"):-
    genereNombreAleatoire(Random),
    string_concat("p",Random,X),
    atom_string(Pion,X).
choixPion(Pion,_):-
    read(Pion).




retirer([],_,L,L1):-reverse(L,L1).
>>>>>>> 0f89bf5bb024f5857a02e4e5d81492099d5a63ff
retirer([T|Q],E,L,L1):-T=E,retirer(Q,E,L,L1).
retirer([T|Q],E,L,L1):-T\==E,retirer(Q,E,[T|L],L1).

ajouterElem(X,L,L1):- L1=[X|L].%permet d'ajouter un element dans une liste

afficherLigne([]).
afficherLigne([T|Q]):- write(T), write(" "),afficherLigne(Q).%permet les elements d'une liste

etatPlateau([]).
etatPlateau([C1,C2,C3,C4|Q]):-afficherLigne([C1,C2,C3,C4]), writeln(""),etatPlateau(Q).%affiche l'etat du plateau

extraitDiag(Grille,A,B,C,D):-
    nth0(0,Grille,A),
    nth0(5,Grille,B),
    nth0(10,Grille,C),
    nth0(15,Grille,D).

extraitDiagInv(Grille,A,B,C,D):-
    nth0(3,Grille,A),
    nth0(6,Grille,B),
    nth0(9,Grille,C),
    nth0(12,Grille,D).


ligne("-",_,_,_):-
    !,false.
ligne(_,"-",_,_):-
    !,false.
ligne(_,_,"-",_):-
    !,false.
ligne(_,_,_,"-"):-
    !,false.



ligne(A,B,C,D):-
    L=[A,B,C,D],
    maplist(claire, L).
ligne(A,B,C,D):-
    L=[A,B,C,D],
    maplist(fonce, L).
ligne(A,B,C,D):-
    L=[A,B,C,D],
    maplist(carre, L).
ligne(A,B,C,D):-
    L=[A,B,C,D],
    maplist(ronde, L).
ligne(A,B,C,D):-
    L=[A,B,C,D],
    maplist(haute, L).
ligne(A,B,C,D):-
    L=[A,B,C,D],
    maplist(basse, L).
ligne(A,B,C,D):-
    L=[A,B,C,D],
    maplist(pleine, L).
ligne(A,B,C,D):-
    L=[A,B,C,D],
    maplist(creuse, L).

transpose([P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16],L):-
    L=[P1,P5,P9,P13,P2,P6,P10,P14,P3,P7,P11,P15,P4,P8,P12,P16].


gagne(Grille):-
    extraitDiag(Grille,A,B,C,D),
    ligne(A,B,C,D),
    !.
gagne(Grille):-
    extraitDiagInv(Grille,A,B,C,D),
    ligne(A,B,C,D),
    !.
gagne(Grille):-
    traiteGrille(Grille),!.
gagne(Grille):-
    transpose(Grille,GrilleTranspose),
    traiteGrille(GrilleTranspose),
    !.


traiteGrille([]):-false.
traiteGrille([T1,T2,T3,T4|Q]):-
    ligne(T1,T2,T3,T4),!;
    traiteGrille(Q).
% place un pion sur la grille et renvoie la grille avec le pion place

placerPion(_,"",[],Res,Res1):-reverse(Res,Res1).%ici on renvoie une grille avec le bon ordre
placerPion(0,"",[T|Q],Res,Res1):-
    placerPion(0,"",Q,[T|Res],Res1).%on rempli la grille de retour avec les elements du plateau
placerPion(0,Pion,[_|Q],Res,Res1):-
    placerPion(0,"",Q,[Pion|Res],Res1).%on place le pion dans la nouvelle grille

placerPion(Numero,Pion,[T|Q],Res,Res1):-%on parcours le palteau jusqu'a la position ou l'on doit placer le pion
    piece(Pion),
    Numero>(0),Numero<16,
    N1 is Numero-1,
    placerPion(N1,Pion,Q,[T|Res],Res1).

<<<<<<< HEAD
entrerPion(PiecesDisponibles,Pion,Pion):-%on verifie que le pion ente par l'utilisateur est valide, on lui demande d'en entrer un autre tant qu'il n'en entre pas un valide
=======
entrerPion(PiecesDisponibles,Pion,Pion,_):-
>>>>>>> 0f89bf5bb024f5857a02e4e5d81492099d5a63ff
    piece(Pion),pionDisponible(Pion,PiecesDisponibles),!.
entrerPion(PiecesDisponibles,_,Retour,Joueur):-
    %on demande a l'utilisateur de choisir un pion
    writeln("Quel pion voulez vous placer parmi les suivants? N'oubliez pas de mettre un point a la fin de votre saisie"),      afficherLigne(PiecesDisponibles),writeln(""),

    %on récupere ce qu'il a ecrit
    choixPion(Pion,Joueur),
    entrerPion(PiecesDisponibles,Pion,Retour,Joueur).


pionDisponible(Pion,[Pion|_]).
pionDisponible(Pion,[T|Q]):-Pion\=T,pionDisponible(Pion,Q).

<<<<<<< HEAD
entrerPlace(PlacesOccupees,Position,Position):-%on verifie que la position entree par l'utilisateur est valide, on lui demande d'en entrer une autre tant qu'il n'en entre pas une valide

=======
entrerPlace(PlacesOccupees,Position,Position,_):-
>>>>>>> 0f89bf5bb024f5857a02e4e5d81492099d5a63ff
    number(Position),Position>(-1),Position<16,
    placeDisponible(Position,PlacesOccupees),!.
entrerPlace(PlacesOccupees,_,Retour,Joueur):-
    writeln("A quelle position voulez vous le placer?"),
    afficherLigne(PlacesOccupees),writeln(""),nl,
    choixPosition(Position,Joueur),
    entrerPlace(PlacesOccupees,Position,Retour,Joueur).

placeDisponible(_,[]).
placeDisponible(Position,[T|Q]):-
    Position\=T,placeDisponible(Position,Q).

inverser(A,B,B,A).%inverse deux elements.



soustraireList([],_,ListeRetour,ListeRetour1):-reverse(ListeRetour,ListeRetour1),!.%les elements de la premiere liste presents egalement dans la deuxieme sont retires de la premiere.
soustraireList([T1|Q1],L2,ListeRetour,ListeRetour1):-
    member(T1,L2),
    soustraireList(Q1,L2,ListeRetour,ListeRetour1),!.
soustraireList([T1|Q1],L2,ListeRetour,ListeRetour1):-
    soustraireList(Q1,L2,[T1|ListeRetour],ListeRetour1),!.

afficherInfosPions():-
    writeln("p1 : claire,ronde,pleine,haute"),
    writeln("p2 : claire,ronde,creuse,haute"),
    writeln("p3 : claire,ronde,pleine,basse"),
    writeln("p4 : claire,ronde,creuse,basse"),
    writeln("p5 : claire,carre,pleine,haute"),
    writeln("p6 : claire,carre,creuse,haute"),
    writeln("p7 : claire,carre,pleine,basse"),
    writeln("p8 : claire,carre,creuse,basse"),
    writeln("p9 : fonce,ronde,pleine,haute"),
    writeln("p10 : fonce,ronde,creuse,haute"),
    writeln("p11 : fonce,ronde,pleine,basse"),
    writeln("p12 : fonce,ronde,creuse,basse"),
    writeln("p13 : fonce,carre,pleine,haute"),
    writeln("p14 : fonce,carre,creuse,haute"),
    writeln("p15 : fonce,carre,pleine,basse"),
    writeln("p16 : fonce,carre,creuse,basse").








