:-include("predicatsquarto.pl").
:-use_module(library(random)).


coisirMeilleurePosition([],_,MeilleurScore).
choisirMeilleurePosition([T|Q],ScoreCourant,MeilleurScore,MeilleurePosition).


scoresPlateau(_,_,[],Scores,Scores1,_):-reverse(Scores,Scores1),!.
scoresPlateau(Plateau,Pion,[_|Q],Scores,Scores1,Compteur):-listeElements(Elements),
   casesAdjacentes(Compteur,CA),
   connexion(Pion,Plateau,CA,Elements,Valeur),
   Compteur1 is Compteur+1,
   scoresPlateau(Plateau,Pion,Q,[Valeur|Scores],Scores1,Compteur1).



connexion(_,_,[],_,0).%la liste vide correspond aux cases adjacentes.
connexion(Pion,Plateau,[T|Q],Elements,ValeurRetour):-
% evalue la force de connexion avec les pions sur les cases les plus
% proches, retourne la case pour laquelle il y le plus de connexions
% possibles. Pour que ça marche, si un pion a une connexion avec un
% autre il faut que la connexion existe aussi avec tout les autres pions
% presents sur la ligne/colonne/diago, il faudra une autre fonction
% pour la ligne. une case avec connexion =100.
%
  nth0(T,Plateau,PionVoisin),
  nbElementsCommuns(Pion,PionVoisin,Elements,N),
  connexion(Pion,Plateau,Q,Elements,ValeurRetour1),ValeurRetour is ValeurRetour1+N,!.


listeElements([claire,fonce,ronde,carre,haute,basse,creuse,pleine]).
nbElementsCommuns(_,_,[],0).%calcule le nombre d'elements communs entre 2 pions
nbElementsCommuns(Pion1,Pion2,[T|Q],N):-L=[Pion1,Pion2],maplist(T,L),nbElementsCommuns(Pion1,Pion2,Q,N1),N is 1+N1,!.
nbElementsCommuns(Pion1,Pion2,[_|Q],N):-nbElementsCommuns(Pion1,Pion2,Q,N),!.

scoreCase(_,[],_).
scoreCase(Case,[T|Q],Score).

casesAdjacentes(0,CasesAdjacentes):-CasesAdjacentes=[2,5,6].
casesAdjacentes(1,CasesAdjacentes):-CasesAdjacentes=[1,3,6].
casesAdjacentes(2,CasesAdjacentes):-CasesAdjacentes=[2,7,4].
casesAdjacentes(3,CasesAdjacentes):-CasesAdjacentes=[3,7,8].
casesAdjacentes(4,CasesAdjacentes):-CasesAdjacentes=[1,6,9].
casesAdjacentes(5,CasesAdjacentes):-CasesAdjacentes=[1,2,5,7,10,11].
casesAdjacentes(6,CasesAdjacentes):-CasesAdjacentes=[3,4,6,8,10,11].
casesAdjacentes(7,CasesAdjacentes):-CasesAdjacentes=[4,7,12].
casesAdjacentes(8,CasesAdjacentes):-CasesAdjacentes=[5,10,11].
casesAdjacentes(9,CasesAdjacentes):-CasesAdjacentes=[6,7,9,11,13,14].
casesAdjacentes(10,CasesAdjacentes):-CasesAdjacentes=[6,7,10,12,15,16].
casesAdjacentes(11,CasesAdjacentes):-CasesAdjacentes=[8,11,16].
casesAdjacentes(12,CasesAdjacentes):-CasesAdjacentes=[9,10,14].
casesAdjacentes(13,CasesAdjacentes):-CasesAdjacentes=[10,13,15].
casesAdjacentes(14,CasesAdjacentes):-CasesAdjacentes=[14,11,16].
casesAdjacentes(15,CasesAdjacentes):-CasesAdjacentes=[15,11,12].




trouverLigne(N,1):-number(N),N>0,N<5,!.
trouverLigne(N,2):-number(N),N>4,N<9,!.
trouverLigne(N,3):-number(N),N>8,N<13,!.
trouverLigne(N,4):-number(N),N>12,N<17,!.



trouverColonne(N,1):-number(N),(N=:=1;N=:=5;N=:=9;N=:=13),!.
trouverColonne(N,1):-number(N),(N=:=2;N=:=6;N=:=10;N=:=14),!.
trouverColonne(N,1):-number(N),(N=:=3;N=:=7;N=:=11;N=:=15),!.
trouverColonne(N,1):-number(N),(N=:=4;N=:=8;N=:=12;N=:=16),!.



trouverDiago(N):-number(N),(N=:=1;N=:=6;N=:=11;N=:=16).
trouverDiagoInv(N):-number(N),(N=:=13;N=:=10;N=:=7;N=:=4).





evaluerLigne(). %permet d'évaluer si tout les pions d'une ligne ont des proprietes communes et si oui lesquelles.

evaluerColonne().
evaluerDiagos().


