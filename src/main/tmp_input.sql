----trigger function for meeting in one section, ensure no conflict

CREATE OR REPLACE FUNCTION check_conflict() RETURNS trigger AS $conflict$
BEGIN

	CREATE TEMPORARY TABLE meeting_to_link (
		idmeeting_weekly integer,
		day_of_week integer,
		start_time TIME,
		end_time TIME
	);
	
	CREATE TEMPORARY TABLE meeting_in_same_section (
		idmeeting_weekly integer,
		day_of_week integer,
		start_time TIME,
		end_time TIME
	);

	
	CREATE TEMPORARY TABLE meeting_conflict (
		idmeeting_weekly integer
	);

	insert into meeting_to_link
		(SELECT idmeeting_weekly, day_of_week, start_time, end_time 
		FROM meeting_weekly 
		WHERE idmeeting_weekly = NEW.idmeeting_weekly
		);
	
	
	INSERT INTO meeting_in_same_section 
		(SELECT idmeeting_weekly, day_of_week, start_time, end_time 
			FROM meeting_weekly NATURAL JOIN section_weekly 	
			WHERE idsection = NEW.idsection
			AND idmeeting_weekly <> NEW.idmeeting_weekly
		);
 	
 	INSERT INTO meeting_conflict 
	(SELECT b.idmeeting_weekly FROM meeting_to_link as a, meeting_in_same_section as b
	where a.day_of_week = b.day_of_week and (not (a.start_time < b.start_time AND a.end_time <= b.start_time)) and (not (a.start_time >= b.end_time AND a.end_time > b.end_time))
	);
	
IF (EXISTS (SELECT * FROM meeting_conflict)) THEN
		DROP TABLE meeting_to_link;
		DROP TABLE meeting_in_same_section;
		DROP TABLE meeting_conflict;
		RAISE EXCEPTION 'Time conflict with existed weekly meeting in this section';


	END IF;
	
	DROP TABLE meeting_to_link;
	DROP TABLE meeting_in_same_section;
	DROP TABLE meeting_conflict;
	RETURN NEW;

END;
$conflict$ LANGUAGE plpgsql;

--create trigger for inserting into section_weekly
CREATE OR REPLACE TRIGGER insert_section_weekly
BEFORE INSERT ON section_weekly
FOR EACH ROW
EXECUTE PROCEDURE check_conflict();


------------------------------------------------------------------------------------------------------------------



-----trigger function for max enrollment
CREATE OR REPLACE FUNCTION check_max_enrollment() RETURNS trigger AS $max$
 BEGIN
 	IF ((SELECT max_enrollment FROM section WHERE idsection = NEW.idsection) <= (SELECT (COUNT(*)) FROM student_section WHERE idsection = NEW.idsection GROUP BY idsection)) THEN
 	RAISE EXCEPTION 'Can not enroll because the max enrollment has been reached.';
 	END IF;
 	RETURN NEW;
 END;
 $max$ LANGUAGE plpgsql;
 
 ----create trigger for inserting into student_section
CREATE OR REPLACE TRIGGER insert_student_section
BEFORE INSERT ON student_section
FOR EACH ROW
EXECUTE PROCEDURE check_max_enrollment();


-----------------------------------------------------------------------------------------------------------

----trigger function for faculty schedule conflict
CREATE OR REPLACE FUNCTION check_conflict_faculty() RETURNS trigger AS $conflict_faculty$
BEGIN
	CREATE TEMPORARY TABLE meeting_to_add (
		idmeeting_weekly integer,
		day_of_week integer,
		start_time TIME,
		end_time TIME
	);
	
	CREATE TEMPORARY TABLE meeting_already_taught (
		idmeeting_weekly integer,
		day_of_week integer,
		start_time TIME,
		end_time TIME
	);
	
	CREATE TEMPORARY TABLE meeting_conflict (
		idmeeting_weekly integer
	);
	
	insert into meeting_to_add
		(SELECT idmeeting_weekly, day_of_week, start_time, end_time 
		FROM section_weekly natural join meeting_weekly 
		WHERE idsection = NEW.idsection
		);
	
	INSERT INTO meeting_already_taught 
		(SELECT idmeeting_weekly, day_of_week, start_time, end_time 
			FROM faculty_section natural join section_weekly natural join meeting_weekly 
			WHERE idfaculty = NEW.idfaculty
			AND idsection <> NEW.idsection
		);
		
		SELECT idmeeting_weekly, day_of_week, start_time, end_time 
			FROM faculty_section natural join section_weekly natural join meeting_weekly 
			WHERE idfaculty = 1
			AND idsection <> 4;
		
	INSERT INTO meeting_conflict 
	(SELECT a.idmeeting_weekly FROM meeting_to_add as a, meeting_already_taught as b
	where a.day_of_week = b.day_of_week 
	and (not (a.start_time < b.start_time AND a.end_time <= b.start_time)) 
	and (not (a.start_time >= b.end_time AND a.end_time > b.end_time))
	);
	
	IF (EXISTS (SELECT * FROM meeting_conflict)) THEN
		DROP TABLE meeting_to_add;
		DROP TABLE meeting_already_taught;
		DROP TABLE meeting_conflict;
		RAISE EXCEPTION 'Time conflict with a weekly meeting that the faculty taught';


	END IF;
	
	DROP TABLE meeting_to_add;
	DROP TABLE meeting_already_taught;
	DROP TABLE meeting_conflict;
	RETURN NEW;
	
END;
$conflict_faculty$ LANGUAGE plpgsql;


--create trigger for inserting into section_weekly
CREATE OR REPLACE TRIGGER insert_faculty_section
BEFORE INSERT ON faculty_section
FOR EACH ROW
EXECUTE PROCEDURE check_conflict_faculty();
