% Undirected sample graph
edge(a, b).  edge(a, c).
edge(b, d).  edge(b, e).
edge(c, f).  edge(d, g).
edge(e, g).  edge(f, g).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

% Estimated distance to goal g
heuristic(a, 6).  heuristic(b, 4).  heuristic(c, 5).
heuristic(d, 1).  heuristic(e, 2).  heuristic(f, 3).
heuristic(g, 0).

greedy_best_first(Start, Goal, Path) :-
    heuristic(Start, H),
    greedy_queue([H-[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

greedy_queue([_- [Goal | Rest] | _], Goal, [Goal | Rest]).
greedy_queue([_- [Node | Rest] | Queue], Goal, Path) :-
    findall(H-[Next, Node | Rest],
            (connected(Node, Next),
             \+ member(Next, [Node | Rest]),
             heuristic(Next, H)),
            Children),
    append(Queue, Children, Frontier),
    keysort(Frontier, OrderedFrontier),
    greedy_queue(OrderedFrontier, Goal, Path).

% ?- greedy_best_first(a, g, Path).
