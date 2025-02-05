homme(pierre).
homme(marc).
homme(paul).
homme(jacques).
homme(mennan).
femme(marie).
femme(sophie).
femme(lucie).
femme(julie).

parent(pierre, paul).
parent(julie, sophie).
parent(marie, paul).
parent(marie, lucie).
parent(lucie, mennan).
parent(marc, sophie).
parent(jacques, marc).
parent(jacques, pierre).
parent(marc, pierre).
parent(sophie, marie).

% Définir le prédicat parents/2
parents(X, Y) :- parent(X, Y).

%Définir le prédicat grands-parents
grandparent(X, Y) :- parent(X, Z) , parent(Z, Y).

% Règles pour définir père et mère
pere(X, Y) :- homme(X), parent(X, Y).
mere(X, Y) :- femme(X), parent(X, Y).

% Règles pour les frères et soeurs
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Règle pour calculer la longueur d'une liste

longueur([], 0).
longueur([_ | Queue], N) :- longueur(Queue, M), N is M + 1.

% Règle pour savoir si un membre est présent dans la liste

membre(X, [X | _]). % X est le premier élément de la liste
membre(X, [_ | Queue]) :- membre(X, Queue). % X est dans le reste de la liste 

% Règle pour savoir les oncles et tantes
oncle_ou_tante(X, Y) :- parent(Z, Y), sibling(X, Z).

%Règle pour savoir les cousins
cousin(X, Y) :- parent(Z, X), sibling(Z, W), parent(W, Y).
