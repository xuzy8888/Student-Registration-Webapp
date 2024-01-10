INSERT INTO student (idstudent, ssn, firstname, middlename, lastname, residency, enrollment)
VALUES
(111111111, '111111111', 'student1', '', ' ', ' ', ' '),
(222222222, '222222222', 'student2', '', ' ', ' ', ' '),
(333333333, '333333333', 'student3', '', ' ', ' ', ' '),
(444444444, '444444444', 'student4', '', ' ', ' ', ' '),
(555555555, '555555555', 'student5', '', ' ', ' ', ' '),
(6, '6', 'student6', '', ' ', ' ', ' '),
(7, '7', 'student7', '', ' ', ' ', ' '),
(8, '8', 'student8', '', ' ', ' ', ' '),
(9, '9', 'student9', '', ' ', ' ', ' '),
(10, '10', 'student10', '', ' ', ' ', ' '),
(11, '11', 'student11', '', ' ', ' ', ' '),
(12, '12', 'student12', '', ' ', ' ', ' '),
(13, '13', 'student13', '', ' ', ' ', ' '),
(14, '14', 'student14', '', ' ', ' ', ' '),
(15, '15', 'student15', '', ' ', ' ', ' ');





INSERT INTO faculty(idfaculty, faculty_name, title, department)
VALUES
(11000, 'faculty1', 'prrofessor', 'cse'),
(11001, 'faculty2', 'prrofessor', 'cse'),
(11002, 'faculty3', 'prrofessor', 'cse');


INSERT INTO term(idterm, year, quarter)
VALUES
(201801, 2018, 'fall'),
(201802, 2018, 'winter'),
(201803, 2018, 'spring'),
(201701, 2017, 'fall'),
(201702, 2017, 'winter'),
(201703, 2017, 'spring'),
(201501, 2015, 'fall'),
(201502, 2015, 'winter'),
(201503, 2015, 'spring');


INSERT INTO attendance(idstudent_attendance, idstudent, idterm)
VALUES
(29000, 111111111, 201803),
(default, 222222222, 201803),
(default, 333333333, 201803),
(default, 444444444, 201803),
(default, 555555555, 201803),
(default, 111111111, 201501),
(default, 222222222, 201501),
(default, 333333333, 201501),
(default, 444444444, 201501),
(default, 555555555, 201701),
(default, 111111111, 201701),
(default, 222222222, 201701),
(default, 333333333, 201701),
(default, 444444444, 201701),
(default, 555555555, 201701);

-- grading option: both, letter, s/u
INSERT INTO course(idcourse, course_num, department, has_lab, grading_opt, units_range, consent_needed)
VALUES
(123456, 'cse132b', 'cse', 'false', 'both', '4', 'false'),
(579573, 'cse132a', 'cse', 'false', 'letter', '4', 'false'),
(583768, 'cse132c', 'cse', 'false', 'both', '4', 'false'),
(578698, 'cse150a', 'cse', 'false', 'letter', '4', 'false'),
(578699, 'cse124a', 'cse', 'false', 'letter', '4', 'false'),
(578600, 'cse130', 'cse', 'false', 'letter', '4', 'false'),
(000001, 'cse005', 'cse', 'false', 'letter', '4', 'false'),
(000002, 'cse000', 'cse', 'false', 'letter', '4', 'false'),
(000003, 'cse007', 'cse', 'false', 'letter', '4', 'false'),
(000004, 'cse008', 'cse', 'false', 'letter', '4', 'false'),
(000005, 'math132b', 'math', 'false', 'both', '4', 'false'),
(000006, 'math132a', 'math', 'false', 'letter', '4', 'false'),
(000007, 'math132c', 'math', 'false', 'both', '4', 'false'),
(000008, 'math150a', 'math', 'false', 'letter', '4', 'false'),
(000009, 'math124a', 'math', 'false', 'letter', '4', 'false'),
(000010, 'math130', 'math', 'false', 'letter', '4', 'false'),
(000011, 'math005', 'math', 'false', 'letter', '4', 'false'),
(000012, 'math000', 'math', 'false', 'letter', '4', 'false'),
(000013, 'math007', 'math', 'false', 'letter', '4', 'false'),
(000014, 'math008', 'math', 'false', 'letter', '4', 'false');


--cse100,2018 fall,software engineering
INSERT INTO class(idclass, idterm, idcourse, title)
VALUES
(1234567, 201803, 579573, '201803_cse132A'),
(2345678, 201803, 578698, '201803_cse150'),
(2345679, 201803, 578699, '201803_cse124A'),
(2345001, 201803, 123456, '201803_cse132b'),
(2345002, 201803, 583768, '201803_cse132c'),
(2345003, 201803, 578600, '201803_cse130'),
(2345004, 201701, 000001, '201701_cse005'),
(2345005, 201701, 000002, '201701_cse000'),
(2345006, 201701, 000003, '201701_cse007'),
(2345007, 201803, 000001, '201803_cse005'),
(2345008, 201803, 000002, '201803_cse000'),
(2345009, 201803, 000003, '201803_cse007'),
(2345010, 201701, 000004, '201701_cse008'),
(2345011, 201803, 000004, '201803_cse008'),
(2345012, 201803, 000005, '201803_math132A'),
(2345013, 201803, 000006, '201803_math150'),
(2345014, 201803, 000007, '201803_math124A'),
(2345015, 201803, 000008, '201803_math132b'),
(2345016, 201803, 000009, '201803_math132c'),
(2345017, 201803, 000010, '201803_math130'),
(2345018, 201701, 000011, '201803_math005'),
(2345019, 201701, 000012, '201803_math000'),
(2345020, 201701, 000013, '201803_math007'),
(2345021, 201803, 000011, '201803_math005'),
(2345022, 201803, 000012, '201803_math000'),
(2345023, 201803, 000013, '201803_math007'),
(2345024, 201701, 000014, '201803_math008'),
(2345025, 201803, 000014, '201803_math008'),
(2345026, 201501, 579573, '201501_cse132A'),
(2345027, 201501, 578698, '201501_cse150'),
(2345028, 201501, 578699, '201501_cse124A'),
(2345029, 201501, 123456, '201501_cse132b'),
(2345030, 201501, 583768, '201501_cse132c'),
(2345031, 201501, 578600, '201501_cse130'),
(2345032, 201501, 000001, '201501_cse005'),
(2345033, 201501, 000002, '201501_cse000'),
(2345034, 201501, 000003, '201501_cse007'),
(2345035, 201501, 000004, '201501_cse008'),
(2345036, 201501, 000005, '201501_math132A'),
(2345037, 201501, 000006, '201501_math150'),
(2345038, 201501, 000007, '201501_math124A'),
(2345039, 201501, 000008, '201501_math132b'),
(2345040, 201501, 000009, '201501_math132c'),
(2345041, 201501, 000010, '201501_math130'),
(2345042, 201501, 000011, '201501_math005'),
(2345043, 201501, 000012, '201501_math000'),
(2345044, 201501, 000013, '201501_math007'),
(2345045, 201501, 000014, '201501_math008'),
(2345046, 201701, 578698, '201803_cse150');




--cse100, 2018 fall, software engineering, A01, 100wl
INSERT INTO section(idsection, idclass, max_enrollment, label)
VALUES
(2344, 1234567, 100, 'a00'),
(2345, 2345678, 100, 'a00'),
(2346, 2345679, 100, 'a00'),
(2347, 2345001, 100, 'a00'),
(2348, 2345002, 100, 'a00'),
(2349, 2345003, 100, 'a00'),
(2350, 2345004, 100, 'a00'),
(2351, 2345005, 100, 'a00'),
(2352, 2345006, 100, 'a00'),
(2353, 2345007, 100, 'a00'),
(2354, 2345008, 100, 'a00'),
(2355, 2345009, 100, 'a00'),
(2356, 2345010, 100, 'a00'),
(2357, 2345011, 100, 'a00'),
(2358, 2345012, 100, 'a00'),
(2359, 2345013, 100, 'a00'),
(2360, 2345014, 100, 'a00'),
(2361, 2345015, 100, 'a00'),
(2362, 2345016, 100, 'a00'),
(2363, 2345017, 100, 'a00'),
(2364, 2345018, 100, 'a00'),
(2365, 2345019, 100, 'a00'),
(2366, 2345020, 100, 'a00'),
(2367, 2345021, 100, 'a00'),
(2368, 2345022, 100, 'a00'),
(2369, 2345023, 100, 'a00'),
(2370, 2345024, 100, 'a00'),
(2371, 2345025, 100, 'a00'),
(2372, 2345026, 100, 'a00'),
(2373, 2345027, 100, 'a00'),
(2374, 2345028, 100, 'a00'),
(2375, 2345029, 100, 'a00'),
(2376, 2345030, 100, 'a00'),
(2377, 2345031, 100, 'a00'),
(2378, 2345032, 100, 'a00'),
(2379, 2345033, 100, 'a00'),
(2380, 2345034, 100, 'a00'),
(2381, 2345035, 100, 'a00'),
(2382, 2345036, 100, 'a00'),
(2383, 2345037, 100, 'a00'),
(2384, 2345038, 100, 'a00'),
(2385, 2345039, 100, 'a00'),
(2386, 2345040, 100, 'a00'),
(2387, 2345041, 100, 'a00'),
(2388, 2345042, 100, 'a00'),
(2389, 2345043, 100, 'a00'),
(2390, 2345044, 100, 'a00'),
(2391, 2345045, 100, 'a00');

INSERT INTO faculty_class(idfaculty_class, idfaculty, idclass)
VALUES
(22000, 11000, 1234567),
(default, 11000, 2345026),
(default, 11000, 2345001),
(default, 11000, 2345029),
(default, 11000, 2345002),
(default, 11000, 2345030),
(default, 11001, 2345678),
(default, 11001, 2345027),
(default, 11001, 2345679),
(default, 11001, 2345028),
(default, 11002, 2345004),
(default, 11002, 2345005),
(default, 11002, 2345006),
(default, 11002, 2345007),
(default, 11002, 2345008),
(default, 11002, 2345009),
(default, 11002, 2345010),
(default, 11002, 2345011),
(default, 11002, 2345032),
(default, 11002, 2345033),
(default, 11002, 2345034),
(default, 11002, 2345035);



--michael, cse100,2018 fall,software engineering
INSERT INTO student_class(idstudent_class, idstudent, idclass, units, grade_option, grade)
VALUES
(7001, 111111111, 1234567, 4, 'letter', 'IN'),
(default, 222222222, 1234567, 2, 'letter', 'IN'),
(default, 333333333, 1234567, 2, 'letter', 'IN'),
(default, 111111111, 2345003, 4, 'letter', 'IN'),
(default, 111111111, 2345029, 4, 'lettter', 'A'),
(default, 222222222, 2345029, 2, 'letter', 'B'),
(default, 333333333, 2345029, 2, 'letter', 'C'),
(default, 111111111, 2345030, 4, 'lettter', 'B'),
(default, 222222222, 2345030, 2, 'letter', 'C'),
(default, 333333333, 2345030, 2, 'letter', 'A'),
(default, 6, 2345010, 4, 'letter', 'A'), 
(default, 6, 2345004, 4, 'letter', 'A'), 
(default, 6, 2345046, 4, 'letter', 'A'), 
(default, 7, 2345010, 4, 'letter', 'A'), 
(default, 7, 2345004, 4, 'letter', 'A'),
(default, 7, 2345046, 4, 'letter', 'A'),
(default, 8, 2345010, 4, 'letter', 'B'), 
(default, 8, 2345004, 4, 'letter', 'A'),
(default, 8, 2345046, 4, 'letter', 'A'),
(default, 9, 2345010, 4, 'letter', 'B'), 
(default, 9, 2345004, 4, 'letter', 'A'),
(default, 9, 2345046, 4, 'letter', 'A'),
(default, 10, 2345010, 4, 'letter', 'C'), 
(default, 10, 2345004, 4, 'letter', 'A'),
(default, 10, 2345046, 4, 'letter', 'A'),
(default, 11, 2345010, 4, 'letter', 'C'), 
(default, 11, 2345004, 4, 'letter', 'B'),
(default, 11, 2345046, 4, 'letter', 'B'),
(default, 12, 2345010, 4, 'letter', 'C'), 
(default, 12, 2345004, 4, 'letter', 'B'),
(default, 12, 2345046, 4, 'letter', 'B'),
(default, 13, 2345010, 4, 'letter', 'D'), 
(default, 13, 2345004, 4, 'letter', 'B'),
(default, 13, 2345046, 4, 'letter', 'B'),
(default, 14, 2345010, 4, 'letter', 'D'), 
(default, 14, 2345004, 4, 'letter', 'B'),
(default, 14, 2345046, 4, 'letter', 'B'),
(default, 15, 2345010, 4, 'letter', 'D'), 
(default, 15, 2345004, 4, 'letter', 'C'),
(default, 15, 2345046, 4, 'letter', 'C');

INSERT INTO student_section(idstudent_section, idstudent, idsection, is_waitlist)
VALUES
(8001, 111111111, 2344, 'false'),
(default, 222222222, 2344, 'false'),
(default, 333333333, 2344, 'false'),
(default, 111111111, 2347, 'false'),
(default, 222222222, 2347, 'false'),
(default, 333333333, 2347, 'false'),
(default, 111111111, 2349, 'false'),
(default, 111111111, 2375, 'false'),
(default, 222222222, 2375, 'false'),
(default, 333333333, 2375, 'false'),
(default, 111111111, 2376, 'false'),
(default, 222222222, 2376, 'false'),
(default, 333333333, 2376, 'false');


INSERT INTO degree(iddegree, name, type, total_units, min_gpa)
VALUES
(7878, 'computer_science_major', 'bs', 32, 3.0),
(6767, 'math_major', 'bs', 36,3.0),
(5656, 'computer_science', 'ms', 0, 3.0),
(3434, 'math', 'ms', 0, 3.0),
(3435, 'economics_minor', 'bs', 0, 3.0),
(3436, 'math_minor', 'bs', 0,3.0),
(3437, 'aquatics_minor', 'bs', 0,3.0);


INSERT INTO student_degree(idstudent_degree, idstudent, iddegree)
VALUES
(default, 111111111, 3435),
(default, 222222222, 7878),
(default, 222222222, 3436),
(default, 333333333, 6767),
(default, 333333333, 3437),
(default, 444444444, 5656),
(default, 555555555, 3434);



INSERT INTO undergraduate(idundergraduate, idstudent, college)
VALUES
(55001, 111111111, ' '),
(55002, 222222222, ' '),
(55003, 333333333, ' ');


INSERT INTO ms_graduate(idms_graduate, idstudent, department)
VALUES
(50001, 444444444, 'cse'),
(50002, 555555555, 'cse');


INSERT INTO lower_division(idlower_division, iddegree, units_req, gpa_req)
VALUES
(962, 7878, 12, 3.0),
(944, 6767, 16, 3.0);

INSERT INTO lower_division_course(idlower_division_course, idlower_division, idcourse)
VALUES
(61001, 962, 000001),
(default, 962, 000002),
(default, 962, 000003),
(default, 962, 000004),
(default, 944, 000011),
(default, 944, 000012),
(default, 944, 000013),
(default, 944, 000014);



INSERT INTO upper_division(idupper_division, iddegree, units_req, gpa_req)
VALUES
(869, 7878, 12, 3.0),
(683, 6767, 8, 3.0);

INSERT INTO upper_division_course(idupper_division_course, idupper_division, idcourse)
VALUES
(86001, 869,  123456),
(default, 869,  579573),
(default, 869,  583768),
(default, 869,  578698),
(default, 869,  578699),
(default, 869,  578600),
(default, 683,  000005),
(default, 683,  000006),
(default, 683,  000007),
(default, 683,  000008),
(default, 683,  000009),
(default, 683,  000010),
(default, 683,  000011),
(default, 683,  000012),
(default, 683,  000013),
(default, 683,  000014);



INSERT INTO technical_elective(idtechnical_elective, iddegree, units_req, gpa_req)
VALUES
(679, 7878, 8, 3.0),
(362, 6767, 12, 3.0);

INSERT INTO technical_elective_course(idtechnical_elective_course, idtechnical_elective, idcourse)
VALUES
(75000, 679, 000001),
(default, 679, 000002),
(default, 679, 000003),
(default, 679, 000004),
(default, 362, 000011),
(default, 362, 000012),
(default, 362, 000013),
(default, 362, 000014),
(default, 679,  123456),
(default, 679,  579573),
(default, 679,  583768),
(default, 679,  578698),
(default, 679,  578699),
(default, 679,  578600),
(default, 362,  000005),
(default, 362,  000006),
(default, 362,  000007),
(default, 362,  000008),
(default, 362,  000009),
(default, 362,  000010),
(default, 362,  000011),
(default, 362,  000012),
(default, 362,  000013),
(default, 362,  000014);



INSERT INTO concentration(idconcentration, iddegree, units_req, gpa_req, concentration_name)
VALUES
(12, 5656, 6, 3.0, 'database'),
(13, 5656, 12, 3.0, 'system'),
(14, 3434, 7, 3.0, 'number theory'),
(15, 3434, 7, 3.0, 'calculus');

INSERT INTO concentration_course(idconcentration_course, idconcentration, idcourse) 
VALUES
(401, 12, 123456),
(default, 12, 579573),
(default, 12, 583768),
(default, 13, 578600),
(default, 13, 000002),
(default, 13, 000003),
(default, 13, 123456),
(default, 14, 000005),
(default, 14, 000006),
(default, 14, 000007),
(default, 15, 000005),
(default, 15, 000010),
(default, 15, 000012),
(default, 15, 000013);



-- monday=1, tuesday=2, wednesday=3
INSERT INTO meeting_weekly(idmeeting_weekly, building, room, day_of_week, start_time, end_time, label)
VALUES
(100000, 'building1', 'room1', 1, '01:00', '03:00', 'le'),
(100001, 'building1', 'room1', 3, '01:00', '03:00', 'le'),
(100002, 'building1', 'room1', 5, '01:00', '03:00', 'di'),
(100003, 'building2', 'room2', 2, '02:00', '04:00', 'le'),
(100004, 'building2', 'room2', 4, '02:00', '04:00', 'le'),
(100005, 'building3', 'room3', 2, '20:00', '21:20', 'le'),
(100006, 'building3', 'room3', 4, '20:00', '21:20', 'le'),
(100007, 'building3', 'room3', 1, '12:00', '12:50', 'di'),
(100008, 'building4', 'room4', 2, '15:00', '17:00', 'le'),
(100009, 'building4', 'room4', 4, '15:00', '17:00', 'le'),
(100010, 'building_130', 'room_130', 2, '10:00', '11:00', 'le'),
(100011, 'building_130', 'room_130', 4, '10:00', '11:00', 'le'),
(100012, 'building_130', 'room_130', 5, '09:00', '10:00', 'di'),
(default, 'building1', 'room1', 1, '01:00', '03:00', 'le'),
(default, 'building1', 'room1', 3, '01:00', '03:00', 'le'),
(default, 'building1', 'room1', 5, '01:00', '03:00', 'di'),
(default, 'building2', 'room2', 2, '02:00', '04:00', 'le'),
(default, 'building2', 'room2', 4, '02:00', '04:00', 'le'),
(default, 'building3', 'room3', 2, '20:00', '21:20', 'le'),
(default, 'building3', 'room3', 4, '20:00', '21:20', 'le'),
(default, 'building3', 'room3', 1, '12:00', '12:50', 'di'),
(default, 'building4', 'room4', 2, '15:00', '17:00', 'le'),
(default, 'building4', 'room4', 4, '15:00', '17:00', 'le'),
(default, 'building_130', 'room_130', 2, '10:00', '11:00', 'le'),
(default, 'building_130', 'room_130', 4, '10:00', '11:00', 'le'),
(default, 'building_130', 'room_130', 5, '09:00', '10:00', 'di');



INSERT INTO section_weekly(idsection_weekly, idsection, idmeeting_weekly)
VALUES
(default, 2344, 100000),
(default, 2344, 100001),
(default, 2344, 100002),
(default, 2345, 100003),
(default, 2345, 100004),
(default, 2346, 100005),
(default, 2346, 100006),
(default, 2346, 100007),
(default, 2347, 100008),
(default, 2347, 100009),
(default, 2349, 100010),
(default, 2349, 100011),
(default, 2349, 100012),
(default, 2350, 100000),
(default, 2350, 100001),
(default, 2350, 100002),
(default, 2351, 100003),
(default, 2351, 100004),
(default, 2352, 100005),
(default, 2352, 100006),
(default, 2352, 100007),
(default, 2353, 100008),
(default, 2353, 100009),
(default, 2356, 100010),
(default, 2356, 100011),
(default, 2356, 100012);












