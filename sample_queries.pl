% ============================================
% SAMPLE QUERIES AND EXPECTED OUTPUT
% ============================================

% Query 1: Who are the children of John?
% ?- parent(john, X).
% Expected Output:
% X = tom ;
% X = emma.

% Query 2: Who are the siblings of Tom?
% ?- sibling(tom, X).
% Expected Output:
% X = emma.

% Query 3: Who are the grandparents of Sarah?
% ?- grandparent(X, sarah).
% Expected Output:
% X = robert ;
% X = susan.

% Query 4: Is Lisa a cousin of Sarah?
% ?- cousin(lisa, sarah).
% Expected Output:
% true.

% Query 5: Who are all the cousins of Tom?
% ?- cousin(tom, X).
% Expected Output:
% X = sarah ;
% X = chris ;
% X = lisa ;
% X = daniel.

% Query 6: Who are the descendants of James?
% ?- descendant(X, james).
% Expected Output:
% X = john ;
% X = linda ;
% X = tom ;
% X = emma.

% Query 7: Who are the ancestors of Emma?
% ?- ancestor(X, emma).
% Expected Output:
% X = john ;
% X = linda ;
% X = james ;
% X = mary.

% Query 8: Who is the mother of Michael?
% ?- mother(X, michael).
% Expected Output:
% X = susan.

% Query 9: Who are the brothers of Barbara?
% ?- brother(X, barbara).
% Expected Output:
% X = michael.

% Query 10: Find all children of Mary using the helper rule
% ?- children_of(mary, Children).
% Expected Output:
% Children = [john, linda].

% Query 11: Find all siblings of Chris
% ?- siblings_of(chris, Siblings).
% Expected Output:
% Siblings = [sarah].

% Query 12: Find all descendants of Robert
% ?- descendants_of(robert, Descendants).
% Expected Output:
% Descendants = [michael, barbara, sarah, chris].