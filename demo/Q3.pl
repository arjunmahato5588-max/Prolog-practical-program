% Append two lists
my_append([], List, List).
my_append([Head | Tail], List, [Head | Result]) :-
    my_append(Tail, List, Result).

% Reverse a list using an accumulator
my_reverse(List, Reversed) :-
    reverse_acc(List, [], Reversed).

reverse_acc([], Accumulator, Accumulator).
reverse_acc([Head | Tail], Accumulator, Reversed) :-
    reverse_acc(Tail, [Head | Accumulator], Reversed).

% Search for an element in a list
member_of(Item, [Item | _]).
member_of(Item, [_ | Tail]) :-
    member_of(Item, Tail).

% Find the length of a list
list_length([], 0).
list_length([_ | Tail], Length) :-
    list_length(Tail, TailLength),
    Length is TailLength + 1.

% ?- my_append([1,2], [3,4], X), my_reverse(X, R).
% ?- member_of(3, [1,2,3]), list_length([a,b,c], N).
