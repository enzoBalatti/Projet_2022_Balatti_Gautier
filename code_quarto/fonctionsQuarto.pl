retirer([],_,L,L1):-reverse(L,L1).
retirer([T|Q],E,L,L1):-T=E,retirer(Q,E,L,L1).
retirer([T|Q],E,L,L1):-T\==E,retirer(Q,E,[T|L],L1).

ajouterElem(X,L,L1):- L1=[X|L].

afficherLigne([]).
afficherLigne([T|Q]):- write(T), write(" "),afficherLigne(Q).

etatPlateau([]).
etatPlateau([C1,C2,C3,C4|Q]):-afficherLigne([C1,C2,C3,C4]), writeln(""),etatPlateau(Q).

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


ligne(A,_,_,_):-
    A="-",
    !,false.
ligne(_,A,_,_):-
    A="-",
    !,false.
ligne(_,_,A,_):-
    A="-",
    !,false.
ligne(_,_,_,A):-
    A="-",
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

placerPion(_,"",[],Res,Res1):-reverse(Res,Res1).

placerPion(0,"",[T|Q],Res,Res1):-
    placerPion(0,"",Q,[T|Res],Res1).
placerPion(0,Pion,[_|Q],Res,Res1):-
    placerPion(0,"",Q,[Pion|Res],Res1).

placerPion(Numero,Pion,[T|Q],Res,Res1):-
    piece(Pion),
    Numero>(0),Numero<16,
    N1 is Numero-1,
    placerPion(N1,Pion,Q,[T|Res],Res1).

entrerPion(PiecesDisponibles,Pion,Pion):-
    piece(Pion),pionDisponible(Pion,PiecesDisponibles),!.
entrerPion(PiecesDisponibles,_,Retour):-
    %on demande a l'utilisateur de choisir un pion
    writeln("Quel pion voulez vous placer parmi les suivants? N'oubliez pas de mettre un point a la fin de votre saisie"),      afficherLigne(PiecesDisponibles),writeln(""),

    %on r�cupere ce qu'il a ecrit
    read(Pion),
    entrerPion(PiecesDisponibles,Pion,Retour).


pionDisponible(Pion,[Pion|_]).
pionDisponible(Pion,[T|Q]):-Pion\=T,pionDisponible(Pion,Q).

entrerPlace(PlacesOccupees,Position,Position):-
    number(Position),Position>(-1),Position<16,
    placeDisponible(Position,PlacesOccupees),!.
entrerPlace(PlacesOccupees,_,Retour):-
    writeln("A quelle position voulez vous le placer?"),
    afficherLigne(PlacesOccupees),writeln(""),nl,
    read(Position)
    ,entrerPlace(PlacesOccupees,Position,Retour).

placeDisponible(_,[]).
placeDisponible(Position,[T|Q]):-
    Position\=T,placeDisponible(Position,Q).

inverser(A,B,B,A).


poserPion(["-",B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],1,Piece,[Piece,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P]):-!.
poserPion([A,"-",C,D,E,F,G,H,I,J,K,L,M,N,O,P],2,Piece,[A,Piece,C,D,E,F,G,H,I,J,K,L,M,N,O,P]):-!.
poserPion([A,B,"-",D,E,F,G,H,I,J,K,L,M,N,O,P],3,Piece,[A,B,Piece,D,E,F,G,H,I,J,K,L,M,N,O,P]):-!.
poserPion([A,B,C,"-",E,F,G,H,I,J,K,L,M,N,O,P],4,Piece,[A,B,C,Piece,E,F,G,H,I,J,K,L,M,N,O,P]):-!.
poserPion([A,B,C,D,"-",F,G,H,I,J,K,L,M,N,O,P],5,Piece,[A,B,C,D,Piece,F,G,H,I,J,K,L,M,N,O,P]):-!.
poserPion([A,B,C,D,E,"-",G,H,I,J,K,L,M,N,O,P],6,Piece,[A,B,C,D,E,Piece,G,H,I,J,K,L,M,N,O,P]):-!.
poserPion([A,B,C,D,E,F,"-",H,I,J,K,L,M,N,O,P],7,Piece,[A,B,C,D,E,F,Piece,H,I,J,K,L,M,N,O,P]):-!.
poserPion([A,B,C,D,E,F,G,"-",I,J,K,L,M,N,O,P],8,Piece,[A,B,C,D,E,F,G,Piece,I,J,K,L,M,N,O,P]):-!.
poserPion([A,B,C,D,E,F,G,H,"-",J,K,L,M,N,O,P],9,Piece,[A,B,C,D,E,F,G,H,Piece,J,K,L,M,N,O,P]):-!.
poserPion([A,B,C,D,E,F,G,H,I,"-",K,L,M,N,O,P],10,Piece,[A,B,C,D,E,F,G,H,I,Piece,K,L,M,N,O,P]):-!.
poserPion([A,B,C,D,E,F,G,H,I,J,"-",L,M,N,O,P],11,Piece,[A,B,C,D,E,F,G,H,I,J,Piece,L,M,N,O,P]):-!.
poserPion([A,B,C,D,E,F,G,H,I,J,K,"-",M,N,O,P],12,Piece,[A,B,C,D,E,F,G,H,I,J,K,Piece,M,N,O,P]):-!.
poserPion([A,B,C,D,E,F,G,H,I,J,K,L,"-",N,O,P],13,Piece,[A,B,C,D,E,F,G,H,I,J,K,L,Piece,N,O,P]):-!.
poserPion([A,B,C,D,E,F,G,H,I,J,K,L,M,"-",O,P],14,Piece,[A,B,C,D,E,F,G,H,I,J,K,L,M,Piece,O,P]):-!.
poserPion([A,B,C,D,E,F,G,H,I,J,K,L,M,N,"-",P],15,Piece,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,Piece,P]):-!.
poserPion([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,"-"],16,Piece,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,Piece]):-!.
poserPion(Grille,_,Piece,NewGrille):-write('Tu ne peux pas le placer ici'),nl,read(N),poserPion(Grille,N,Piece,NewGrille).











