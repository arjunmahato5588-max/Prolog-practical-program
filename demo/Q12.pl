:- use_module(library(lists)).

% queens(N, Rows) returns one safe row position for each column 1..N.
queens(N, Rows) :-
    numlist(1, N, Candidates),
    permutation(Candidates, Rows),
    safe_queens(Rows).

safe_queens([]).
safe_queens([Row | OtherRows]) :-
    safe_from(Row, OtherRows, 1),
    safe_queens(OtherRows).

safe_from(_, [], _).
safe_from(Row, [OtherRow | RemainingRows], Distance) :-
    Row =\= OtherRow,
    abs(Row - OtherRow) =\= Distance,
    NextDistance is Distance + 1,
    safe_from(Row, RemainingRows, NextDistance).

% ?- queens(8, Rows).
