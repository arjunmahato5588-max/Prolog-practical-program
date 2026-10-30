% student(Name, Marks).
student(mohit, 92).
student(ananya, 78).
student(rahul, 55).
student(priya, 34).

topper(Student) :-
    student(Student, Marks),
    Marks >= 85.

average(Student) :-
    student(Student, Marks),
    Marks >= 40,
    Marks < 85.

fail(Student) :-
    student(Student, Marks),
    Marks < 40.

classification(Student, topper) :- topper(Student).
classification(Student, average) :- average(Student).
classification(Student, fail) :- fail(Student).

% ?- classification(mohit, Category).
% ?- topper(Student).
