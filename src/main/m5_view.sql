-----------------------------------------------cpqg-view and trigger------------------
DROP TABLE IF EXISTS cpqg_table CASCADE;

create table cpqg_table(
	idcourse integer,
	course_num text,
	idfaculty integer,
	faculty_name text,
	idterm integer,
	year integer,
	quarter text,
	grade text,
	idcpqg_table SERIAL
	);

insert into cpqg_table(idcourse,course_num,idfaculty,faculty_name,idterm,year,quarter,grade)
(
	select idcourse,course_num,idfaculty,faculty_name,idterm,year,quarter,grade
	from(
		select grade,idterm,idcourse, idfaculty,faculty_name
		from(
			select idclass, grade,idterm,idcourse
			from student_class natural join class
			) as a natural join faculty_class natural join faculty
		) as b natural join term natural join course
);


CREATE VIEW cpqg AS
(SELECT * FROM cpqg_table);


CREATE OR REPLACE FUNCTION after_insert_student_class() RETURNS trigger AS $after_insert_student_class$
BEGIN
	INSERT INTO cpqg_table
	(select idcourse,course_num,idfaculty,faculty_name,idterm,year,quarter,grade
	from(
		select idstudent_class, grade,idterm,idcourse, idfaculty,faculty_name
		from(
			select idstudent_class, idclass, grade,idterm,idcourse
			from student_class natural join class
			) as a natural join faculty_class natural join faculty
		) as b natural join term natural join course
	where idstudent_class = NEW.idstudent_class LIMIT 1);
	RETURN NULL;
END;
$after_insert_student_class$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER insert_cpqg
AFTER INSERT ON student_class
FOR EACH ROW
EXECUTE PROCEDURE after_insert_student_class();


-----------------------------------cpg view and trigger----------------------------
DROP TABLE IF EXISTS cpg_table CASCADE;

create table cpg_table(
	idcourse integer,
	course_num text,
	idfaculty integer,
	faculty_name text,
	grade text,
	units integer,
	idcpg_table SERIAL
	);
	
insert into cpg_table(idcourse,course_num,idfaculty,faculty_name,grade,units)
(
	select idcourse,course_num,idfaculty,faculty_name,grade,units
	from(
		select grade,units,idcourse, idfaculty,faculty_name
		from(
			select idclass, grade,units,idcourse
			from student_class natural join class
			) as a natural join faculty_class natural join faculty
		) as b natural join course
);

CREATE VIEW cpg AS
(SELECT * FROM cpg_table);

CREATE OR REPLACE FUNCTION after_insert_student_class_cpg() RETURNS trigger AS $after_insert_student_class_cpg$
BEGIN
	INSERT INTO cpg_table
	(select idcourse,course_num,idfaculty,faculty_name,grade,units
	from(
		select idstudent_class, grade,units,idcourse, idfaculty,faculty_name
		from(
			select idstudent_class, idclass, grade,units,idcourse
			from student_class natural join class
			) as a natural join faculty_class natural join faculty
		) as b natural join course
	where idstudent_class = NEW.idstudent_class LIMIT 1);
	RETURN NULL;
END;
$after_insert_student_class_cpg$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER insert_cpg
AFTER INSERT ON student_class
FOR EACH ROW
EXECUTE PROCEDURE after_insert_student_class_cpg();