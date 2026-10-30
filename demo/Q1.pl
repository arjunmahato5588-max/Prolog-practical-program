% Student-Course Knowledge Base
student(mohit).
student(ananya).
student(rahul).

course(ai_ml).
course(prolog).
course(data_structures).

enrolled(mohit, ai_ml).
enrolled(mohit, prolog).
enrolled(ananya, ai_ml).
enrolled(rahul, data_structures).

teaches(dr_sharma, ai_ml).
teaches(ms_gupta, prolog).
teaches(mr_khan, data_structures).

classmate(Student1, Student2) :-
    enrolled(Student1, Course),
    enrolled(Student2, Course),
    Student1 \= Student2.

student_teacher(Student, Teacher) :-
    enrolled(Student, Course),
    teaches(Teacher, Course).

% Sample goals:
% ?- enrolled(mohit, Course).
% ?- student_teacher(mohit, Teacher).
