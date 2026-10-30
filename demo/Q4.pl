% timetable(Day, Time, Faculty, Subject, Classroom).
timetable(monday,    '09:00', dr_sharma, ai_ml,            lab_201).
timetable(monday,    '11:00', ms_gupta,  prolog,           lab_202).
timetable(tuesday,   '09:00', mr_khan,   data_structures,  room_105).
timetable(wednesday, '10:00', dr_sharma, machine_learning, lab_201).
timetable(thursday,  '12:00', ms_gupta,  ai_ml,            room_107).
timetable(friday,    '10:00', mr_khan,   prolog,           lab_202).

faculty_schedule(Faculty, Day, Time, Subject, Room) :-
    timetable(Day, Time, Faculty, Subject, Room).

subject_schedule(Subject, Day, Time, Faculty, Room) :-
    timetable(Day, Time, Faculty, Subject, Room).

room_schedule(Room, Day, Time, Faculty, Subject) :-
    timetable(Day, Time, Faculty, Subject, Room).

% ?- faculty_schedule(dr_sharma, Day, Time, Subject, Room).
% ?- subject_schedule(prolog, Day, Time, Faculty, Room).
% ?- room_schedule(lab_202, Day, Time, Faculty, Subject).
