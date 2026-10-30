% Undirected sample graph
edge(a, b).  edge(a, c).
edge(b, d).  edge(b, e).
edge(c, f).  edge(e, g).
edge(f, g).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

% A queue entry is a path stored in reverse order.
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

bfs_queue([[Goal | Rest] | _], Goal, [Goal | Rest]).
bfs_queue([[Node | Rest] | Queue], Goal, Path) :-
    findall([Next, Node | Rest],
            (connected(Node, Next), \+ member(Next, [Node | Rest])),
            NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, Path).

% ?- bfs(a, g, Path).
