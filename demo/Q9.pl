% Maximize f(X) = 49 - (X - 7)^2 over integer values 0..20.
objective(X, Score) :-
    Score is 49 - (X - 7) * (X - 7).

neighbor(X, Next) :-
    Next is X - 1,
    Next >= 0.
neighbor(X, Next) :-
    Next is X + 1,
    Next =< 20.

best_neighbor(X, Best, BestScore) :-
    findall(Score-Candidate,
            (neighbor(X, Candidate), objective(Candidate, Score)),
            Candidates),
    keysort(Candidates, Ordered),
    last(Ordered, BestScore-Best).

hill_climb(Start, Optimum, Score) :-
    objective(Start, StartScore),
    climb(Start, StartScore, Optimum, Score).

climb(Current, CurrentScore, Optimum, Score) :-
    best_neighbor(Current, Next, NextScore),
    ( NextScore > CurrentScore ->
        climb(Next, NextScore, Optimum, Score)
    ;   Optimum = Current,
        Score = CurrentScore
    ).

% ?- hill_climb(0, Optimum, Score).
