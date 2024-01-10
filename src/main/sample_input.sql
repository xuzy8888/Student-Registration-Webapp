\i D:/cse132b/cse132b-v1/src/main/m5_view.sql
m3_prepared;


INSERT INTO student values ('ssn12345','Michael','something','Xu','China','yes');--1
--2 john smith

INSERT INTO term values (default, 2022,'spring');--1
--21 spring 2
--21 fall 3
--21 summer  4
insert into term values (default, 2018,'fall');-- 5
insert into term values (default, 2018,'spring');-- 6
insert into term values (default, 2019,'fall'); --7
insert into term values (default, 2019,'winter'); --8


insert into attendance values(default,1,1);--1 michael xu in 2022 spring
insert into attendance values(default,2,1);--2 john smith in 2022 spring

insert into faculty values(default,'Test Faculty','professor','computer science');--1

insert into course values(default,'cse100','computer science','no','letter','4','no'); --1
insert into course values(default,'cse101','computer science','yes','letter','4-12','yes');--2
insert into course values(default,'cse8a','computer science','yes','letter','4','yes'); --3
insert into course values(default,'cse8b','computer science','yes','letter','4','yes'); ---4
insert into course values(default,'cse11','computer science','yes','letter','4','yes'); --5
insert into course values(default,'cse20','computer science','yes','letter','4','yes');--6

 insert into class values(default,1,1,'cse100in22sp'); --1
 insert into class values(default,1,2,'cse101in22sp'); --2
 insert into class values(default,5,3,'cse8ain18fa'); --3
 insert into class values(default,5,4,'cse8bin18fa'); --4
 insert into class values(default,6,5,'cse11in18sp'); --5
 insert into class values(default,6,6,'cse20in18sp'); --6
  
 insert into section values(default,1,100,'cse100in22spA01'); --1
 insert into section values(default,1,100,'cse100in22spA02'); --2
 insert into section values(default,1,50,'cse100in22spA03'); --3
 
 insert into student_section values(default,1,1,'no'); --1 michael xu in cse100in22sp A01 section
 
 --cse100 22 sp secction A01 lecture mon--1
 insert into meeting_weekly values(default,'building1','room1',1,'04:00','04:50','cse100in22spA01LectureMon');
 --2
 insert into meeting_weekly values(default,'building1','room1',3,'04:00','04:50','cse100in22spA01LectureWed');
 --3
 insert into meeting_weekly values(default,'building2','room2',1,'04:20','04:30','cse100in22spA02LectureMon');
 --4
 insert into meeting_weekly values(default,'building2','room2',1,'01:20','01:30','cse100in22spA03LectureMon');
 --5
 insert into meeting_weekly values(default,'building3','room6',5,'10:20','11:30','cse100in22spA01LectureFri');
 --6
 insert into meeting_weekly values(default,'building3','room6',4,'10:00','11:00','cse100in22spA01LectureThur');
 
 insert into section_weekly values(default, 1,1); --1 cse100in22sp A01 section/ cse100in22spA01LectureMon
 insert into section_weekly values(default, 1,2); --2 cse100in22spA01 / LectureWes
 insert into section_weekly values(default, 2,3); --3 cse100in22spA02 /lectureMon
 insert into section_weekly values(default, 3,4); --4 cse100in22spA03 /lectureMon
 insert into section_weekly values(default, 1,5); --5 cse100in22spA01 / LectureFri
 insert into section_weekly values(default, 1,6); --6 cse100in22spA01 / LectureThurs
 
 insert into faculty_class values(default,1,1); --1, test faculty teach cse100 in sp22
 insert into faculty_class values(default,1,2); --2 test faculty teach cse101 in sp22
 
 insert into student_class values(default,1,1,4,'letter','IP'); --1 michael xu take cse100 in sp22, grade in process
 insert into student_class values(default,1,2,4,'letter','IP'); --2 michael xu take cse101 in sp22, grade in process
 insert into student_class values(default,1,3,4,'letter','A'); 
 insert into student_class values(default,1,4,4,'letter','D');
 insert into student_class values(default,1,5,4,'letter','B+');
 insert into student_class values(default,1,6,4,'letter','B-');
 
 insert into student_class values(default,2,1,4,'letter','A'); --7
 
 insert into meeting_review_session values(default,'building1', 'room2','220505','5:00','6:00'); --1 cse100in22sp A01 section/ cse100in22spA01 review 1
 
 insert into section_review_session values(default, 1,1); --1 cse100in22sp A01 section/ cse100in22spA01 review 1
 
 
 
 
 

 
 --1 a
 select SSN, FIRSTNAME, MIDDLENAME, LASTNAME from student NATURAL JOIN attendance NATURAL JOIN term WHERE year=2022 and quarter='spring';
  select course.course_num, class.title, student_class.units, student_class.grade_option_type from student NATURAL JOIN student_section NATURAL JOIN section NATURAL JOIN student_class NATURAL JOIN class NATURAL JOIN course NATURAL JOIN term where SSN=? AND year=2022 and quarter='spring';
 
 --1 b class roster
 select class.title, course.course_num, term.year, term.quarter from class natural join course natural join term;
 select SSN, FIRSTNAME, MIDDLENAME, LASTNAME, RESIDENCY, ENROLLMENT, student_class.units, student_class.grade_option from student_class natural join student natural join class where class.title = 'cse100in22sp';
 
 --1c
 ----class left join grade conversion
 select * from student_class left join grade_conversion on grade = letter_grade;
 ----get all students
 select distinct SSN, FIRSTNAME, MIDDLENAME, LASTNAME from student NATURAL JOIN attendance NATURAL JOIN term;
 ----ssn name term course class grade number_grade, 
 select SSN, FIRSTNAME, MIDDLENAME, LASTNAME, year, quarter, title, course_num, grade, number_grade 
 from student natural join student_class natural join class natural join course natural join term left join grade_conversion on grade = letter_grade 
 where number_grade > 0;
 ----quarter gpa
 select  year, quarter, avg(number_grade) as quarter_gpa 
 from student natural join student_class natural join class natural join course natural join term left join grade_conversion on grade = letter_grade 
 where number_grade > 0 and SSN = 'ssn12345'
 group by year,quarter;
 
  select  year, quarter, sum(number_grade*units)/sum(units) as quarter_gpa
 from student natural join student_class natural join class natural join course natural join term left join grade_conversion on grade = letter_grade 
 where number_grade > 0 and SSN = ?
 group by year,quarter;
 ----cumulative gpa
 select sum(quarter_gpa*quarter_units)/sum(quarter_units) as cumulative_gpa
from 
	(
	select  year, quarter, sum(number_grade*units)/sum(units) as quarter_gpa , sum(units) as quarter_units
 	from student natural join student_class natural join class natural join course natural join term left join grade_conversion on grade = letter_grade 
 	where number_grade > 0 and SSN = ?
 	group by year,quarter
	) term_gpa;
	
	
	
----2a

(select course_num, title as class_title from course natural join class natural join term where term.year = 2022 and term.quarter='spring') all_classes
------all id of weekly meetings that student can not take
(select distinct all_meetings.idmeeting_weekly 
from (select course_num, class.title as class_title, section.label as section_num, meeting_weekly.idmeeting_weekly, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time
	from course natural join class natural join term natural join section natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly
	where term.year = 2022 and term.quarter='spring') all_meetings,
	(select course_num, class.title as class_title, section.label as section_num, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time
	from student natural join student_section natural join section natural join class natural join term natural join course natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly
	where term.year = 2022 and term.quarter='spring' and ssn = 'ssn12345') student_meetings 	
where all_meetings.start_time >= student_meetings.start_time and all_meetings.start_time <= student_meetings.end_time) occupied_meeting

------section with weekly_meeting_id in occupied_meeting
select distinct idsection as unavailable_sections
from section_weekly 
where idmeeting_weekly in (
select distinct all_meetings.idmeeting_weekly 
from (select course_num, class.title as class_title, section.label as section_num, meeting_weekly.idmeeting_weekly, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time
	from course natural join class natural join term natural join section natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly
	where term.year = 2022 and term.quarter='spring') all_meetings,
	(select course_num, class.title as class_title, section.label as section_num, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time
	from student natural join student_section natural join section natural join class natural join term natural join course natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly
	where term.year = 2022 and term.quarter='spring' and ssn = 'ssn12345') student_meetings 	
where all_meetings.start_time >= student_meetings.start_time and all_meetings.start_time <= student_meetings.end_time)

------course/class/section can not take
select distinct all_info.course_num, all_info.title as class_title, all_info.label as section_num
from (course natural join class natural join section) all_info, section_weekly
where all_info.idsection = section_weekly.idsection and section_weekly.idmeeting_weekly in (select distinct all_meetings.idmeeting_weekly 
from (select course_num, class.title as class_title, section.label as section_num, meeting_weekly.idmeeting_weekly, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time
	from course natural join class natural join term natural join section natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly
	where term.year = 2022 and term.quarter='spring') all_meetings,
	(select course_num, class.title as class_title, section.label as section_num, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time
	from student natural join student_section natural join section natural join class natural join term natural join course natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly
	where term.year = 2022 and term.quarter='spring' and ssn = ?) student_meetings 	
where all_meetings.day_of_week = student_meetings.day_of_week and (all_meetings.start_time >= student_meetings.start_time and all_meetings.start_time <= student_meetings.end_time) or (all_meetings.end_time >= student_meetings.start_time and all_meetings.end_time <= student_meetings.end_time) or (all_meetings.end_time >= student_meetings.end_time and all_meetings.start_time <= student_meetings.start_time));

select distinct all_info.course_num, all_info.title as class_title, all_info.label as section_num 
from (course natural join class natural join section) all_info, section_weekly 
where all_info.idsection = section_weekly.idsection and section_weekly.idmeeting_weekly in 
(select distinct all_meetings.idmeeting_weekly from 
(select course_num, class.title as class_title, section.label as section_num, meeting_weekly.idmeeting_weekly, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time 
from course natural join class natural join term natural join section natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly 
where term.year = 2022 and term.quarter='spring') all_meetings, 
(select course_num, class.title as class_title, section.label as section_num, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time 
from student natural join student_section natural join section natural join class natural join term natural join course natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly 
where term.year = 2022 and term.quarter='spring' and ssn = 'ssn12345') student_meetings 
where all_meetings.day_of_week = student_meetings.day_of_week and (all_meetings.start_time >= student_meetings.start_time and all_meetings.start_time <= student_meetings.end_time) or (all_meetings.end_time >= student_meetings.start_time and all_meetings.end_time <= student_meetings.end_time) or (all_meetings.end_time >= student_meetings.end_time and all_meetings.start_time <= student_meetings.start_time));

--2b
---select from all sections of current quarter
select distinct section.idsection, course_num, title, label 
from course natural join class natural join section natural join term
where term.year = 2022 and term.quarter = 'spring';

---all students taking that section
select distinct idstudent
from student_section where idsection = 1;

--all weekly meetings these students took
select distinct day_of_week, start_time, end_time
from student_section natural join section_weekly natural join meeting_weekly
where idstudent in (select distinct idstudent from student_section where idsection = ?);

--all weekly review session these students took
select distinct date, start_time, end_time
from student_section natural join section_review_session natural join meeting_review_session
where idstudent in (select distinct idstudent from student_section where idsection = ?);




-----3
-------select all course option
select idcourse, course_num from course;

select grade, count(*)
from term natural join course natural join class natural join faculty_class natural join student_class
where idterm = 1 and idcourse = 1 and idfaculty = 1
group by grade;


select grade, count(*)
from course natural join class natural join faculty_class natural join student_class
where idcourse = ? and idfaculty = ?
group by grade;

select grade, count(*)
from course natural join class natural join student_class
where idcourse = ? 
group by grade;



-----test 1a;
Select course.course_num , class.title , student_class.units, student_class.grade_option from student NATURAL JOIN student_class NATURAL JOIN class NATURAL JOIN  course NATURAL JOIN term where SSN= '111111111' AND year=2018 and quarter='spring'
