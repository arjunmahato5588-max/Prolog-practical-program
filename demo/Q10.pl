:- use_module(library(random)).

% Two peaks: X=3 is a local optimum; X=17 is the global optimum.
objective(X, Score) :-
    ( X =< 10 ->
        Score is 30 - 2 * (X - 3) * (X - 3)
    ;   Score is 40 - (X - 17) * (X - 17)
    ).

neighbor(X, Next) :-
    ( X =:= 0 -> Next = 1
    ; X =:= 20 -> Next = 19
    ; random_between(0, 1, Direction),
      (Direction =:= 0 -> Next is X - 1 ; Next is X + 1)
    ).

accept(Delta, _) :- Delta >= 0.
accept(Delta, Temperature) :-
    Delta < 0,
    Probability is exp(Delta / Temperature),
    Random is random_float,
    Random < Probability.

simulated_annealing(Start, BestX, BestScore) :-
    objective(Start, StartScore),
    anneal(500, 20.0, Start, StartScore, Start, StartScore, BestX, BestScore).

anneal(0, _, _, _, BestX, BestScore, BestX, BestScore).
anneal(Steps, Temperature, Current, CurrentScore, OldBest, OldBestScore,
       BestX, BestScore) :-
    Steps > 0,
    neighbor(Current, Next),
    objective(Next, NextScore),
    Delta is NextScore - CurrentScore,
    ( accept(Delta, Temperature) -> NewCurrent = Next, NewScore = NextScore
    ; NewCurrent = Current, NewScore = CurrentScore
    ),
    ( NewScore > OldBestScore -> NewBest = NewCurrent, NewBestScore = NewScore
    ; NewBest = OldBest, NewBestScore = OldBestScore
    ),
    NextSteps is Steps - 1,
    NextTemperature is Temperature * 0.98,
    anneal(NextSteps, NextTemperature, NewCurrent, NewScore,
           NewBest, NewBestScore, BestX, BestScore).

% ?- set_random(seed(42)), simulated_annealing(3, BestX, BestScore).
