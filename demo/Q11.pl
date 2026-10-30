% Available colors
color(red).
color(green).
color(blue).

% Adjoining regions in the map
adjacent(wa, nt).  adjacent(wa, sa).
adjacent(nt, sa).  adjacent(nt, q).
adjacent(sa, q).   adjacent(sa, nsw).
adjacent(sa, v).   adjacent(q, nsw).
adjacent(nsw, v).

different(X, Y) :- X \= Y.

map_coloring([wa-WA, nt-NT, sa-SA, q-Q, nsw-NSW, v-V, t-T]) :-
    color(WA), color(NT), color(SA), color(Q),
    color(NSW), color(V), color(T),
    different(WA, NT), different(WA, SA),
    different(NT, SA), different(NT, Q),
    different(SA, Q), different(SA, NSW), different(SA, V),
    different(Q, NSW), different(NSW, V).

% ?- map_coloring(Solution).
