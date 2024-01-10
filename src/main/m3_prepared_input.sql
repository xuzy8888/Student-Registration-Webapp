--1. Insert a BS computer science degree with 12 units of upper division units and 12 of
--lower division units, and 8 units of technical electives

insert into degree values(1,'BS Computer','BS', 32 , 2.8); --degree(1),BS computer
insert into lower_division values (1,1,12,2.8); --lower_div(1), 12 units lower BS computer
insert into upper_division values (1,1,12,2.8); --upper_div(1), 12 units upper BS computer
insert into technical_elective values (1,1,8,2.8); --elect(1), 8 units elect BS computer

--2. Insert a BS math with 8 units of upper division units and 16 of lower division units, and
--12 units of technical electives.
insert into degree values(2,'BS Math','BS', 36 , 2.8); --degree(2),BS math
insert into lower_division values (2,2,16,2.8); --lower_div(2), 16 units lower BS math
insert into upper_division values (2,2,8,2.8); --upper_div(2), 8 units upper BS math
insert into technical_elective values (2,2,12,2.8); --elect(2), 12 units elect BS math

--3.Insert MS CS and MS Math degrees. For MS CS, add a database and a systems
--concentration. For MS Math, add a Number theory and a Calculus concentration for
--math.
insert into degree values(3,'MS CS','MS', 100 , 2.8); --degree(3),MS cs
insert into concentration values(1,3,100,2.8,'database'); --concentration(1) mscs database
insert into concentration values(2,3,100,2.8,'system'); --concentration(2) mscs system

insert into degree values(4,'MS Math','MS', 100 , 2.8); --degree(4),MS math
insert into concentration values(3,4,100,2.8,'number theory'); --concentration(3) msmath number theory
insert into concentration values(4,4,100,2.8,'calculus'); --concentration(4) msmath calculus

--5. Insert an undergrad student with attributes : SSN : 111111111, student id : same as SSN,
--Firstname: student1, degree BSC, major Computer science, minor economics
insert into degree values(5,'Minor Economics','minor', 100 , 2.8); --degree(5), economic minor
insert into student values (111111111,'111111111','student1','','lastname','USA','yes'); --student(1), bs computer,minor econ
insert into undergraduate values(1,1,'student1_college'); --undergrats(1), student1
insert into student_degree values(1,1,1); --student_degree(1), student1 bs computer
insert into student_degree values(2,1,5); --student_degree(2), student1 econ minor

--6. Insert an undergrad student with attributes : SSN : 222222222, student id : same as
--SSN, Firstname: student2, degree BSC, major : Computer Science, minor : math
insert into degree values(6,'Minor Math','minor', 100 , 2.8); --degree(6), math minor
insert into student values (222222222,'222222222','student2','','lastname','USA','yes'); --student(2), bs computer,minor math
insert into undergraduate values(2,2,'student2_college'); --undergrats(2), student2
insert into student_degree values(3,2,1); --student_degree(3), student2 bs computer
insert into student_degree values(4,2,6); --student_degree(4), student2 math minor

--7.Insert an undergrad student with attributes : SSN : 333333333, student id : same as
--SSN, Firstname: student3, degree BS in Math, major Math, minor : Aquatics
insert into degree values(7,'Minor Aquatics','minor', 100 , 2.8); --degree(7), aquatics minor
insert into student values (333333333,'333333333','student3','','lastname','USA','yes'); --student(3), bs math,minor aqua
insert into undergraduate values(3,3,'student3_college'); --undergrats(3), student3
insert into student_degree values(5,3,3); --student_degree(5), student3 bs math
insert into student_degree values(6,3,7); --student_degree(6), student3 aqua minor

--8. Insert a course CSE132A and create a class for it for the current academic quarter with
--section A00 with max 4.00 units and it allows only for a Letter grade.
insert into term values(1,2018,'spring'); --term(1), 2018 spring, current quarter

insert into course values(1,'cse132a','cse','yes','letter','0-4','no'); --course(1) cse132a max 4 units
insert into upper_division_course values (1,1,1); --upper_w/_course(1) cse132a bscs upper req
insert into technical_elective_course values (1,1,1); --elective_w/_course(1) cse132a bscs elective req

insert into class values(1,1,1,'cse132a-18sp'); --class(1),cse132a 2018 spring 
insert into section values(1,1,200,'cse132a-18sp-A00'); --section(1),cse132a 2018 spring sectionA00

--9. Insert a regular meeting MW 1:00 PM-3:00 PM every week, and discussion meetings on
--Friday 1:00-1:50PM
insert into meeting_weekly values (1,'building1','room1',1,'13:00','15:00','cse132a-18sp-A00-lectureMonday'); --meeting_weekly(1),cse132a-18sp-A00-lectureMonday
insert into meeting_weekly values (2,'building1','room1',3,'13:00','15:00','cse132a-18sp-A00-lectureWednesday'); --meeting_weekly(2),cse132a-18sp-A00-lecture wednes
insert into meeting_weekly values (3,'building1','room1',5,'13:00','13:50','cse132a-18sp-A00-DiscussionFriday'); --meeting_weekly(3),cse132a-18sp-A00-di friday
insert into section_weekly values(1,1,1); --section_meeting_weekly(1) cse132a-18sp-A00-lectureMonday
insert into section_weekly values(2,1,2); --section_meeting_weekly(2) cse132a-18sp-A00-lectureWednesday
insert into section_weekly values(3,1,3); --section_meeting_weekly(3) cse132a-18sp-A00-DiFriday

--10.Insert a course CSE150A and create a class for it for the current academic quarter with
--section A00 with max 4.00 units and it allows only for a Letter grade.
insert into course values(2,'cse150a','cse','yes','letter','0-4','no'); --course(2) cse150a max 4 units
insert into upper_division_course values (2,1,2); --upper_w/_course(2) cse150a bscs upper req
insert into technical_elective_course values (2,1,2); --elective_w/_course(2) cse150a bscs elective req

insert into class values(2,1,2,'cse150a-18sp'); --class(2),cse150a 2018 spring 
insert into section values(2,2,200,'cse150a-18sp-A00'); --section(2),cse150a 2018 spring sectionA00

--11.Insert regular meeting MW 2:00PM-4:00PM every week.
insert into meeting_weekly values (4,'building1','room1',1,'14:00','16:00','cse150a-18sp-A00-lectureMonday'); --meeting_weekly(4),cse150a-18sp-A00-lectureMonday
insert into meeting_weekly values (5,'building1','room1',3,'14:00','16:00','cse150a-18sp-A00-lectureWednesday'); --meeting_weekly(5),cse150a-18sp-A00-lecture wednes
insert into section_weekly values(4,2,4); --section_meeting_weekly(4) cse150a-18sp-A00-lectureMonday
insert into section_weekly values(5,2,5); --section_meeting_weekly(5) cse150a-18sp-A00-lectureWednesday

--12. Insert a course CSE124A and create a class for it for the current academic quarter with
--section A00 with max 4.00 units and it allows only for a Letter grade.
insert into course values(3,'cse124a','cse','yes','letter','0-4','no'); --course(3) cse124a max 4 units
insert into upper_division_course values (3,1,3); --upper_w/_course(3) cse124a bscs upper req
insert into technical_elective_course values (3,1,3); --elective_w/_course(3) cse124a bscs elective req

insert into class values(3,1,3,'cse124a-18sp'); --class(3),cse124a 2018 spring 
insert into section values(3,3,200,'cse124a-18sp-A00'); --section(3),cse124a 2018 spring sectionA00

--13. Insert regular meeting TuThu 8:00 PM - 9:20 PM every week, and discussion meetings
--on Monday 12:00-12:50 PM
insert into meeting_weekly values (6,'building1','room1',2,'20:00','21:20','cse124a-18sp-A00-lectureTuesday'); --meeting_weekly(6),cse124a-18sp-A00-lecture tues
insert into meeting_weekly values (7,'building1','room1',4,'20:00','21:20','cse124a-18sp-A00-lectureThursday'); --meeting_weekly(7),cse124a-18sp-A00-lecture thurs
insert into meeting_weekly values (8,'building1','room1',1,'12:00','12:50','cse124a-18sp-A00-DiscussionMonday'); --meeting_weekly(8),cse124a-18sp-A00-di mon
insert into section_weekly values(6,3,6); --section_meeting_weekly(6) cse124a-18sp-A00-lectureTues
insert into section_weekly values(7,3,7); --section_meeting_weekly(7) cse124a-18sp-A00-lectureThurs
insert into section_weekly values(8,3,8); --section_meeting_weekly(8) cse124a-18sp-A00-DiMon

--14. Insert a course CSE132B and create a class for it for the current academic quarter and
--section A00 with max 4.00 units and it allows for both a Letter grade and S/U.
insert into course values(4,'cse132b','cse','yes','letter,S/U','0-4','no'); --course(4) cse132b max 4 units
insert into upper_division_course values (4,1,4); --upper_w/_course(4) cse132b bscs upper req
insert into technical_elective_course values (4,1,4); --elective_w/_course(4) cse132b bscs elective req

insert into class values(4,1,4,'cse132b-18sp'); --class(4),cse132b 2018 spring 
insert into section values(4,4,200,'cse132b-18sp-A00'); --section(4),cse132b 2018 spring sectionA00

--15.  Insert regular meeting TuThu 3:00PM-5:00PM every week
insert into meeting_weekly values (9,'building1','room1',2,'15:00','17:00','cse132b-18sp-A00-lectureTuesday'); --meeting_weekly(9),cse132b-18sp-A00-lecture tues
insert into meeting_weekly values (10,'building1','room1',4,'15:00','17:00','cse132b-18sp-A00-lectureThursday'); --meeting_weekly(10),cse132b-18sp-A00-lecture thurs
insert into section_weekly values(9,4,9); --section_meeting_weekly(9) cse132b-18sp-A00-lectureTues
insert into section_weekly values(10,4,10); --section_meeting_weekly(10) cse132b-18sp-A00-lectureThurs

--16. Insert a course CSE132C and create a class for it for the current academic quarter with
--section A00 with max 4.00 units and it allows for both a Letter grade and S/U.
insert into course values(5,'cse132c','cse','yes','letter,S/U','0-4','no'); --course(5) cse132c max 4 units
insert into upper_division_course values (5,1,5); --upper_w/_course(5) cse132c bscs upper req
insert into technical_elective_course values (5,1,5); --elective_w/_course(5) cse132c bscs elective req

insert into class values(5,1,5,'cse132c-18sp'); --class(5),cse132c 2018 spring 
insert into section values(5,5,200,'cse132c-18sp-A00'); --section(5),cse132b 2018 spring sectionA00

--17. . Insert a course CSE130 and create a class for it for the current academic quarter with
--section A00 with max 4.00 units and it allows only for a Letter grade.
insert into course values(6,'cse130','cse','yes','letter','0-4','no'); --course(6) cse130 max 4 units
insert into upper_division_course values (6,1,6); --upper_w/_course(6) cse130 bscs upper req
insert into technical_elective_course values (6,1,6); --elective_w/_course(6) cse130 bscs elective req

insert into class values(6,1,6,'cse130-18sp'); --class(6),cse132c 2018 spring 
insert into section values(6,6,200,'cse130-18sp-A00'); --section(6),cse132b 2018 spring sectionA00

--18. Insert regular meeting TuTh 10:00AM-1:00PM every week and discussions on Friday
--9:00AM-10:00AM.
insert into meeting_weekly values (11,'building1','room1',2,'10:00','13:00','cse130-18sp-A00-lectureTuesday'); --meeting_weekly(11),cse130-18sp-A00-lecture tues
insert into meeting_weekly values (12,'building1','room1',4,'10:00','13:00','cse130-18sp-A00-lectureThursday'); --meeting_weekly(12),cse130-18sp-A00-lecture thurs
insert into meeting_weekly values (13,'building1','room1',5,'9:00','10:00','cse130-18sp-A00-DiscussionFriday'); --meeting_weekly(13),cse130-18sp-A00-di friday
insert into section_weekly values(11,6,11); --section_meeting_weekly(11) cse130-18sp-A00-lectureTues
insert into section_weekly values(12,6,12); --section_meeting_weekly(12) cse130-18sp-A00-lectureThurs
insert into section_weekly values(13,6,13); --section_meeting_weekly(13) cse130-18sp-A00-DiFri

--19.Insert a course CSE005 and create a class for it for the current academic quarter and fall
--2017 with section A00 with max 4.00 units and it allows only for a Letter grade
insert into term values(2,2017,'fall'); --term(2), 2017 fall

insert into course values(7,'cse005','cse','yes','letter','0-4','no'); --course(7) cse005 max 4 units
insert into lower_division_course values (1,1,7); --lower_w/_course(1) cse005 bscs lower req
insert into technical_elective_course values (7,1,7); --elective_w/_course(7) cse005 bscs elective req

insert into class values(7,1,7,'cse005-18sp'); --class(7),cse005 2018 spring 
insert into section values(7,7,200,'cse005-18sp-A00'); --section(7),cse005 2018 spring sectionA00
insert into class values(8,2,7,'cse005-17fa'); --class(8),cse005 2017 fall
insert into section values(8,8,200,'cse005-17fa-A00'); --section(8),cse005 2017 fall sectionA00

--20.Insert a course CSE000 and create a class for it for the current academic quarter and fall
--2017 with section A00 with max 4.00 units and it allows only for a Letter grade.
insert into course values(8,'cse000','cse','yes','letter','0-4','no'); --course(8) cse000 max 4 units
insert into lower_division_course values (2,1,8); --lower_w/_course(2) cse000 bscs lower req
insert into technical_elective_course values (8,1,8); --elective_w/_course(8) cse000 bscs elective req

insert into class values(9,1,8,'cse000-18sp'); --class(9),cse000 2018 spring 
insert into section values(9,9,200,'cse000-18sp-A00'); --section(9),cse000 2018 spring sectionA00
insert into class values(10,2,8,'cse000-17fa'); --class(10),cse000 2017 fall
insert into section values(10,10,200,'cse000-17fa-A00'); --section(10),cse000 2017 fall sectionA00

--21.. Insert a course CSE007 and create a class for it for the current academic quarter and fall
--2017 with section A00 with max 4.00 units and it allows only for a Letter grade.
insert into course values(9,'cse007','cse','yes','letter','0-4','no'); --course(9) cse007 max 4 units
insert into lower_division_course values (3,1,9); --lower_w/_course(3) cse007 bscs lower req
insert into technical_elective_course values (9,1,9); --elective_w/_course(9) cse007 bscs elective req

insert into class values(11,1,9,'cse007-18sp'); --class(11),cse007 2018 spring 
insert into section values(11,11,200,'cse007-18sp-A00'); --section(11),cse007 2018 spring sectionA00
insert into class values(12,2,9,'cse007-17fa'); --class(12),cse007 2017 fall
insert into section values(12,12,200,'cse007-17fa-A00'); --section(12),cse000 2017 fall sectionA00

--22. Insert a course CSE008 and create a class for it for the current academic quarter and fall
--2017 with section A00 with max 4.00 units and it allows only for a Letter grade.
insert into course values(10,'cse008','cse','yes','letter','0-4','no'); --course(10) cse008 max 4 units
insert into lower_division_course values (4,1,10); --lower_w/_course(4) cse008 bscs lower req
insert into technical_elective_course values (10,1,10); --elective_w/_course(10) cse008 bscs elective req

insert into class values(13,1,10,'cse008-18sp'); --class(13),cse008 2018 spring 
insert into section values(13,13,200,'cse008-18sp-A00'); --section(13),cse008 2018 spring sectionA00
insert into class values(14,2,10,'cse008-17fa'); --class(14),cse008 2017 fall
insert into section values(14,14,200,'cse008-17fa-A00'); --section(14),cse008 2017 fall sectionA00

--23.Do a similar exercise for inserting MATH courses. For example, add MATH000 similar to
--CSE000, MATH132A similar to CSE132A etc. Essentially replace CSE with MATH
--keeping everything else the same.
insert into course values(11,'math132a','math','yes','letter','0-4','no'); --course(11) math132a max 4 units
insert into upper_division_course values (7,2,11); --upper_w/_course(7) math132a bs math upper req
insert into technical_elective_course values (11,2,11); --elective_w/_course(11) math132a bs math elective req

insert into course values(12,'math150a','math','yes','letter','0-4','no'); --course(12) math150a max 4 units
insert into upper_division_course values (8,2,12); --upper_w/_course(8) math150a bsmath upper req
insert into technical_elective_course values (12,2,12); --elective_w/_course(12) math150a bs math elective req

insert into course values(13,'math124a','math','yes','letter','0-4','no'); --course(13) math124a max 4 units
insert into upper_division_course values (9,2,13); --upper_w/_course(9) math124a bsmath upper req
insert into technical_elective_course values (13,2,13); --elective_w/_course(13) math124a bsmath elective req

insert into course values(14,'math132b','math','yes','letter,S/U','0-4','no'); --course(14) math132b max 4 units
insert into upper_division_course values (10,2,14); --upper_w/_course(10) math132b bsmath upper req
insert into technical_elective_course values (14,2,14); --elective_w/_course(14) math132b bs math elective req

insert into course values(15,'math132c','math','yes','letter,S/U','0-4','no'); --course(15) math132c max 4 units
insert into upper_division_course values (11,2,15); --upper_w/_course(11) math132c bs math upper req
insert into technical_elective_course values (15,2,15); --elective_w/_course(15) math132c bs math elective req

insert into course values(16,'math130','math','yes','letter','0-4','no'); --course(16) cse130 max 4 units
insert into upper_division_course values (12,2,16); --upper_w/_course(12) math130 bs math upper req
insert into technical_elective_course values (16,2,16); --elective_w/_course(16) math130 bs math elective req

insert into course values(17,'math005','math','yes','letter','0-4','no'); --course(17) math005 max 4 units
insert into lower_division_course values (5,2,17); --lower_w/_course(5) math005 bs math lower req
insert into technical_elective_course values (17,2,17); --elective_w/_course(17) math005 bs math elective req

insert into course values(18,'math000','math','yes','letter','0-4','no'); --course(18) math000 max 4 units
insert into lower_division_course values (6,2,18); --lower_w/_course(6) math000 bs math lower req
insert into technical_elective_course values (18,2,18); --elective_w/_course(18) math000 bs math elective req

insert into course values(19,'math007','math','yes','letter','0-4','no'); --course(19) math007 max 4 units
insert into lower_division_course values (7,2,19); --lower_w/_course(7) math007 bs math lower req
insert into technical_elective_course values (19,2,19); --elective_w/_course(19) math007 bs math elective req

insert into course values(20,'math008','math','yes','letter','0-4','no'); --course(20) math008 max 4 units
insert into lower_division_course values (8,2,20); --lower_w/_course(8) math008 bs math lower req
insert into technical_elective_course values (20,2,20); --elective_w/_course(20) math008 bs math elective req

--24. Repeat adding classes for all the three courses (Same characteristics for sections, units,
--grades) mentioned above for the QUARTER(s): Fall 2015, Fall 2017.

