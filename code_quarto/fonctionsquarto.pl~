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

entrerPion(PiecesDisponibles):-
%on demande a l'utilisateur de choisir un pion
    writeln("Quel pion voulez vous placer parmi les suivants? N'oubliez pas de mettre un point a la fin de votre saisie"),      afficherLigne(PiecesDisponibles),writeln(""),

    %on récupere ce qu'il a ecrit
    read(Pion),pionDisponible(Pion,PiecesDisponibles,_).

pionDisponible(Pion,PiecesDisponibles,PionFinal):-piece(Pion),member(Pion,PiecesDisponibles),PionFinal=Pion,!.
pionDisponible(Pion,PiecesDisponibles,_):-
    not((piece(Pion),member(Pion,PiecesDisponibles))),
    writeln("Choisissez un pion parmi ceux disponibles"),writeln(""),
    entrerPion(PiecesDisponibles).


entrerPlace(PlacesOccupees):-
    writeln("A quelle position voulez vous le placer?"),
    afficherLigne(PlacesOccupees),writeln(""),
    read(Position),placeDisponible(Position,PlacesOccupees,_).

placeDisponible(Position,PlacesOccupees,PositionFinale):-
    number(Position),not(member(Position,PlacesOccupees)),Position>(-1),Position<16,PositionFinale=Position,!.
placeDisponible(Position,PlacesOccupees,_):-
     not(( number(Position),not(member(Position,PlacesOccupees)),Position>(-1),Position<16)),
     writeln("veuillez choisir une place parmi celles disponibles"),writeln(""),
     entrerPlace(PlacesOccupees).

