% ------------------------------------------
% 1. BASIC FACTS - Gender Definitions
% ------------------------------------------

% Generation 1 (Grandparents)
male(james).
male(robert).
male(william).
female(mary).
female(susan).
female(elizabeth).

% Generation 2 (Parents)
male(john).
male(michael).
male(david).
female(linda).
female(barbara).
female(jennifer).

% Generation 3 (Children/Grandchildren)
male(tom).
male(chris).
male(daniel).
female(emma).
female(sarah).
female(lisa).

% ------------------------------------------
% 2. BASIC FACTS - Parent Relationships
% ------------------------------------------

% Parent relationships for Generation 2
parent(james, john).
parent(mary, john).
parent(james, linda).
parent(mary, linda).
parent(robert, michael).
parent(susan, michael).
parent(robert, barbara).
parent(susan, barbara).
parent(william, david).
parent(elizabeth, david).
parent(william, jennifer).
parent(elizabeth, jennifer).

% Parent relationships for Generation 3
parent(john, tom).
parent(linda, tom).
parent(john, emma).
parent(linda, emma).
parent(michael, sarah).
parent(barbara, sarah).
parent(michael, chris).
parent(barbara, chris).
parent(david, lisa).
parent(jennifer, lisa).
parent(david, daniel).
parent(jennifer, daniel).

% ------------------------------------------
% 3. DERIVED RELATIONSHIPS - Rules
% ------------------------------------------

% Mother rule: X is mother of Y if X is female and parent of Y
mother(X, Y) :-
    female(X),
    parent(X, Y).

% Father rule: X is father of Y if X is male and parent of Y
father(X, Y) :-
    male(X),
    parent(X, Y).

% Grandparent rule: X is grandparent of Y if X is parent of Z and Z is parent of Y
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Grandmother rule
grandmother(X, Y) :-
    female(X),
    grandparent(X, Y).

% Grandfather rule
grandfather(X, Y) :-
    male(X),
    grandparent(X, Y).

% Sibling rule: X and Y are siblings if they share a parent and are different people
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Brother rule
brother(X, Y) :-
    male(X),
    sibling(X, Y).

% Sister rule
sister(X, Y) :-
    female(X),
    sibling(X, Y).

% Cousin rule: X and Y are cousins if their parents are siblings
cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B),
    X \= Y.

% Aunt/Uncle rule: X is aunt/uncle of Y if X is sibling of Y's parent
aunt_uncle(X, Y) :-
    parent(Z, Y),
    sibling(X, Z).

% Aunt rule
aunt(X, Y) :-
    female(X),
    aunt_uncle(X, Y).

% Uncle rule
uncle(X, Y) :-
    male(X),
    aunt_uncle(X, Y).

% ------------------------------------------
% 4. RECURSIVE RULES
% ------------------------------------------

% Ancestor rule: X is ancestor of Y
% Base case: X is parent of Y
ancestor(X, Y) :-
    parent(X, Y).

% Recursive case: X is ancestor of Y if X is parent of Z and Z is ancestor of Y
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% Descendant rule: X is descendant of Y (inverse of ancestor)
descendant(X, Y) :-
    ancestor(Y, X).

% ------------------------------------------
% 5. QUERY HELPER RULES
% ------------------------------------------

% Find all children of a person
children_of(Person, Children) :-
    findall(Child, parent(Person, Child), Children).

% Find all siblings of a person
siblings_of(Person, Siblings) :-
    findall(Sibling, sibling(Person, Sibling), Siblings).

% Find all cousins of a person
cousins_of(Person, Cousins) :-
    findall(Cousin, cousin(Person, Cousin), Cousins).

% Find all descendants of a person
descendants_of(Person, Descendants) :-
    findall(Descendant, descendant(Descendant, Person), Descendants).

% Find all ancestors of a person
ancestors_of(Person, Ancestors) :-
    findall(Ancestor, ancestor(Ancestor, Person), Ancestors).