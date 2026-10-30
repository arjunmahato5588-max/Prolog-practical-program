% edge(From, To, Cost) for an undirected weighted graph
edge(a, b, 2).  edge(a, c, 4).
edge(b, d, 3).  edge(b, e, 6).
edge(c, e, 2).  edge(d, g, 5).
edge(e, g, 2).

connected(X, Y, Cost) :- edge(X, Y, Cost).
connected(X, Y, Cost) :- edge(Y, X, Cost).

% Admissible heuristic values for goal g
heuristic(a, 7).  heuristic(b, 6).  heuristic(c, 4).
heuristic(d, 5).  heuristic(e, 2).  heuristic(g, 0).

astar(Start, Goal, Path, TotalCost) :-
    heuristic(Start, H),
    astar_queue([H-node(Start, [Start], 0)], Goal, ReversePath, TotalCost),
    reverse(ReversePath, Path).

astar_queue([_-node(Goal, Path, Cost) | _], Goal, Path, Cost).
astar_queue([_-node(Node, Path, Cost) | Queue], Goal, ResultPath, ResultCost) :-
    findall(F-node(Next, [Next | Path], NewCost),
            (connected(Node, Next, StepCost),
             \+ member(Next, Path),
             NewCost is Cost + StepCost,
             heuristic(Next, H),
             F is NewCost + H),
            Children),
    append(Queue, Children, Frontier),
    keysort(Frontier, OrderedFrontier),
    astar_queue(OrderedFrontier, Goal, ResultPath, ResultCost).

% ?- astar(a, g, Path, Cost).
