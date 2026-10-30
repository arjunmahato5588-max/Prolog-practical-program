% Arithmetic operations
add(A, B, Result) :- Result is A + B.
subtract(A, B, Result) :- Result is A - B.
multiply(A, B, Result) :- Result is A * B.
divide(_, 0, _) :-
    write('Division by zero is not allowed'), fail.
divide(A, B, Result) :-
    B =\= 0,
    Result is A / B.

% Factorial using recursion
factorial(0, 1).
factorial(N, Result) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, Partial),
    Result is N * Partial.

% Fibonacci series term using recursion
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    Result is F1 + F2.

% ?- factorial(5, F), fibonacci(8, Fib).
