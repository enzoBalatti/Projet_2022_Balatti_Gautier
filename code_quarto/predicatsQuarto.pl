nonpiece(-).
piece(p1).
piece(p2).
piece(p3).
piece(p4).
piece(p5).
piece(p6).
piece(p7).
piece(p8).
piece(p9).
piece(p10).
piece(p11).
piece(p12).
piece(p13).
piece(p14).
piece(p15).
piece(p16).

claire(p1).
claire(p2).
claire(p3).
claire(p4).
claire(p5).
claire(p6).
claire(p7).
claire(p8).

ronde(p1).
ronde(p2).
ronde(p3).
ronde(p4).
ronde(p9).
ronde(p10).
ronde(p11).
ronde(p12).

carre(p5).
carre(p6).
carre(p7).
carre(p8).
carre(p13).
carre(p14).
carre(p15).
carre(p16).

haute(p1).
haute(p2).
haute(p5).
haute(p6).
haute(p13).
haute(p14).
haute(p9).
haute(p10).

basse(p3).
basse(p4).
basse(p7).
basse(p8).
basse(p11).
basse(p12).
basse(p15).
basse(p16).


creuse(p10).
creuse(p12).
creuse(p14).
creuse(p16).
creuse(p8).
creuse(p2).
creuse(p4).
creuse(p6).

pleine(p7).
pleine(p1).
pleine(p5).
pleine(p3).
pleine(p15).
pleine(p13).
pleine(p11).
pleine(p9).

fonce(p9).
fonce(p10).
fonce(p11).
fonce(p12).
fonce(p13).
fonce(p14).
fonce(p15).
fonce(p16).

consignes():-writeln("Bonjour, vous vous appr�tez a jouer une partie de quarto, vous pouvez jouer a deux ou affronter l'IA. Pour affronter l'IA, entrez ia lorsque vous devrez entrer le nom d'un joueur."),nl,
    writeln("Les regles du jeu sont les suivantes: vous avez face a vous un plateau de 16 cases, comprenant 4 lignes et 4 colonnes. Dans ce jeu de reflexion, les seize pieces du jeu, toutes differentes, possedent chacune 4 proprietes distinctes : haute ou basse, ronde ou carr�e, claire ou fonc�e, pleine ou creuse. Chacun � son tour choisit et donne une pi�ce � l'adversaire, qui doit la jouer sur une case libre. Le gagnant est celui qui, avec une pi�ce re�ue, cr�e un alignement de 4 pi�ces ayant au moins un caract�re commun.
     Le premier joueur a entrer son nom sera le premier a placer une piece").

initialisationPlateau(Plateau,PiecesDisponibles,PlacesOccupees):-
    Plateau=["-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"],
    PiecesDisponibles=[p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16],
    PlacesOccupees=[].

