:-include("predicatsquarto.pl").
:-use_module(library(random)).

max_liste([X],X) :- !.%renvoie l'element maximal d'une liste
max_liste([X|Xs], M):- max_liste(Xs, M), M >= X,!.
max_liste([X|Xs], X):- max_liste(Xs, M), X >  M,!.

indexOf([Element|_], Element, 0):-!.%renvoie l'index d'un element d'une liste
indexOf([_|Q], Element, Index):-
  indexOf(Q, Element, Index1),
  !,
  Index is Index1+1.

%cette fonction renvoie la position a laquelle la connexion avec les pieces adjacentes est la plus elevee.
choisirMeilleurePosition(Plateau,Pion,MeilleurePosition):-
  scoresPlateau(Plateau,Pion,Plateau,_,Scores,0),
  max_liste(Scores,Max),
  indexOf(Scores,Max,MeilleurePosition),!.


% la fonction scores plateau parcours tout le plateau et inscrit dans
% une liste le score de connexion de chaque case.
scoresPlateau(_,_,[],Scores,Scores1,_):-reverse(Scores,Scores1),!.
scoresPlateau(Plateau,Pion,[T|Q],Scores,Scores1,Compteur):-%si on tombe sur un pion, on renvoie la valeur -1 car on ne peut pas jouer sur un autre pion.
   piece(T),
   Compteur1 is Compteur+1,
   scoresPlateau(Plateau,Pion,Q,[-1|Scores],Scores1,Compteur1).

scoresPlateau(Plateau,Pion,[_|Q],Scores,Scores1,Compteur):-listeElements(Elements),
   casesAdjacentes(Compteur,CA),%on recupere les cases adjacentes de la case courante
   connexion(Pion,Plateau,CA,Elements,Valeur),%on calcule la connexion de la case
   Compteur1 is Compteur+1,
   scoresPlateau(Plateau,Pion,Q,[Valeur|Scores],Scores1,Compteur1).



connexion(_,_,[],_,0).%la liste vide correspond aux cases adjacentes.
connexion(Pion,Plateau,[T|Q],Elements,ValeurRetour):-
% evalue la force de connexion avec les pions sur les cases les plus
% proches. La liste [T|Q] correspond aux cases adjacentes.
  nth0(T,Plateau,PionVoisin),
  nbElementsCommuns(Pion,PionVoisin,Elements,N),
  connexion(Pion,Plateau,Q,Elements,ValeurRetour1),ValeurRetour is ValeurRetour1+N,!.


listeElements([claire,fonce,ronde,carre,haute,basse,creuse,pleine]).%definition des proprietes des pieces

nbElementsCommuns(_,_,[],0).%calcule le nombre d'elements communs entre 2 pions
nbElementsCommuns(Pion1,Pion2,[T|Q],N):-L=[Pion1,Pion2],maplist(T,L),nbElementsCommuns(Pion1,Pion2,Q,N1),N is 1+N1,!.
nbElementsCommuns(Pion1,Pion2,[_|Q],N):-nbElementsCommuns(Pion1,Pion2,Q,N),!.

%renvoie la liste des cases adjacentes a la case passee en parametre
casesAdjacentes(0,CasesAdjacentes):-CasesAdjacentes=[0,4,5].
casesAdjacentes(1,CasesAdjacentes):-CasesAdjacentes=[0,2,5].
casesAdjacentes(2,CasesAdjacentes):-CasesAdjacentes=[1,6,3].
casesAdjacentes(3,CasesAdjacentes):-CasesAdjacentes=[2,6,7].
casesAdjacentes(4,CasesAdjacentes):-CasesAdjacentes=[0,5,8].
casesAdjacentes(5,CasesAdjacentes):-CasesAdjacentes=[0,1,4,6,9,10].
casesAdjacentes(6,CasesAdjacentes):-CasesAdjacentes=[2,3,5,7,9,10].
casesAdjacentes(7,CasesAdjacentes):-CasesAdjacentes=[3,6,11].
casesAdjacentes(8,CasesAdjacentes):-CasesAdjacentes=[4,9,10].
casesAdjacentes(9,CasesAdjacentes):-CasesAdjacentes=[5,6,8,10,12,13].
casesAdjacentes(10,CasesAdjacentes):-CasesAdjacentes=[5,6,9,11,14,15].
casesAdjacentes(11,CasesAdjacentes):-CasesAdjacentes=[7,10,15].
casesAdjacentes(12,CasesAdjacentes):-CasesAdjacentes=[8,9,13].
casesAdjacentes(13,CasesAdjacentes):-CasesAdjacentes=[9,12,14].
casesAdjacentes(14,CasesAdjacentes):-CasesAdjacentes=[13,10,15].
casesAdjacentes(15,CasesAdjacentes):-CasesAdjacentes=[14,10,11].


