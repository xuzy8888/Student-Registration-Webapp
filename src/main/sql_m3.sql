CREATE TABLE student (
    idstudent serial primary key,
  SSN text NOT NULL unique,
  FIRSTNAME text NOT NULL,
  MIDDLENAME text,
  LASTNAME text NOT NULL,
  RESIDENCY text NOT null,
  ENROLLMENT text not null
);

CREATE TABLE faculty (
  idfaculty serial primary key,
  faculty_name text NOT NULL,
  title text NOT NULL,
  department text not null
  );

CREATE TABLE term(
    idterm serial primary key,
   "year" integer not null,
   quarter text not null
);

CREATE TABLE probation (
    idstudent_probation serial primary key,
  idstudent integer REFERENCES student(idstudent) ON DELETE CASCADE ON UPDATE CASCADE,
  idterm integer REFERENCES term(idterm) ON DELETE CASCADE ON UPDATE CASCADE,
  reason text NOT NULL
);

CREATE TABLE attendance (
  idstudent_attendance serial primary key,
  idstudent integer REFERENCES student(idstudent) ON DELETE CASCADE ON UPDATE CASCADE,
  idterm integer REFERENCES term(idterm) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE undergraduate (
    idundergraduate serial primary key,
    idstudent integer references student(idstudent) on delete cascade on update cascade,
    college text NOT NULL
);

CREATE TABLE ms_graduate (
    idms_graduate serial primary key,
    idstudent integer references student(idstudent) on delete cascade on update cascade,
    department text not null
);

CREATE TABLE phd_graduate(
    idphd_gruaduate serial primary key,
    idstudent integer references student(idstudent) on delete cascade on update cascade,
    department text not null
);

CREATE TABLE bsms(
    idbsms serial primary key,
    idms_graduate integer references ms_graduate(idms_graduate) on delete cascade on update cascade, 
    idundergraduate integer references undergraduate(idundergraduate) on delete cascade on update cascade
);

CREATE TABLE phd_candidate(
  idphd_candidate serial primary key,
  idphd_gruaduate integer references phd_graduate(idphd_gruaduate) on delete cascade on update cascade,
  advisor integer references faculty(idfaculty) on delete cascade on update cascade
);

CREATE TABLE phd_candidate_same_dpt_commit(
  idphd_candidate_same_dpt serial primary key,
  idphd_dandidate integer references phd_candidate(idphd_candidate) on delete cascade on update cascade,
  idfaculty integer references faculty(idfaculty) on delete cascade on update cascade
);

CREATE TABLE phd_candidate_diff_dpt_commit(
  idphd_candidate_diff_dpt serial primary key,
  idphd_dandidate integer references phd_candidate(idphd_candidate) on delete cascade on update cascade,
  idfaculty integer references faculty(idfaculty) on delete cascade on update cascade
);

CREATE TABLE degree(
  iddegree SERIAL PRIMARY KEY,
  name text NOT NULL,
  type text NOT NULL,
  total_units integer NOT NULL,
  min_gpa double precision not null
);

CREATE TABLE lower_division (
  idlower_division SERIAL PRIMARY KEY,
  iddegree integer REFERENCES degree(iddegree) ON DELETE CASCADE ON UPDATE CASCADE,
  units_req integer NOT NULL,
  gpa_req double precision NOT NULL
  );

CREATE TABLE upper_division (
  idupper_division SERIAL PRIMARY KEY,
  iddegree integer REFERENCES degree(iddegree) ON DELETE CASCADE ON UPDATE CASCADE,
  units_req integer NOT NULL,
  gpa_req double precision NOT NULL
  );

CREATE TABLE technical_elective (
  idtechnical_elective SERIAL PRIMARY KEY,
  iddegree integer REFERENCES degree(iddegree) ON DELETE CASCADE ON UPDATE CASCADE,
  units_req integer NOT NULL,
  gpa_req double precision NOT NULL
  );

CREATE TABLE concentration (
  idconcentration SERIAL PRIMARY KEY,
  iddegree integer REFERENCES degree(iddegree) ON DELETE CASCADE ON UPDATE CASCADE,
  units_req integer NOT NULL,
  gpa_req double precision NOT NULL,
  concentration_name text NOT NULL
  );

CREATE TABLE student_degree(
  idstudent_degree SERIAL PRIMARY KEY,
  idstudent integer REFERENCES student(idstudent) ON DELETE CASCADE ON UPDATE CASCADE,
  iddegree integer REFERENCES degree(iddegree) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE student_degree_past (
  idstudent_degree_past serial primary key,
  idstudent integer REFERENCES student(idstudent),
  institution text NOT NULL,
  degree text ,
  start_date text not null,
  end_date text not null
);

--cse100
CREATE TABLE course (
  idcourse serial primary key,
  course_num text not null,
  department text NOT NULL,
  has_lab text NOT NULL,
  grading_opt text NOT NULL,
  units_range text not null,
  consent_needed text not null
);

CREATE TABLE course_change (
  idcourse_change serial primary key,
  course_from text NOT NULL,
  course_to text NOT NULL
);

CREATE TABLE concentration_course (
  idconcentration_course SERIAL PRIMARY KEY,
  idconcentration integer REFERENCES concentration(idconcentration) ON DELETE CASCADE ON UPDATE CASCADE,
  idcourse integer REFERENCES course(idcourse) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE lower_division_course (
  idlower_division_course SERIAL PRIMARY KEY,
  idlower_division integer REFERENCES lower_division(idlower_division) ON DELETE CASCADE ON UPDATE CASCADE,
  idcourse integer REFERENCES course(idcourse) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE upper_division_course (
  idupper_division_course SERIAL PRIMARY KEY,
  idupper_division integer REFERENCES upper_division(idupper_division) ON DELETE CASCADE ON UPDATE CASCADE,
  idcourse integer REFERENCES course(idcourse) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE technical_elective_course (
  idtechnical_elective_course SERIAL PRIMARY KEY,
  idtechnical_elective integer REFERENCES technical_elective(idtechnical_elective) ON DELETE CASCADE ON UPDATE CASCADE,
  idcourse integer REFERENCES course(idcourse) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE course_prereq (
  idcourse_prereq serial primary key,
  idcourse integer REFERENCES course(idcourse),
  pre_requisite integer REFERENCES course(idcourse)
);

--cse100,2018 fall,software engineering
CREATE TABLE class (
  idclass SERIAL PRIMARY KEY,
  idterm integer REFERENCES term(idterm) ON DELETE CASCADE ON UPDATE CASCADE,
  idcourse integer REFERENCES course(idcourse) ON DELETE CASCADE ON UPDATE CASCADE,
  title text not null
  );

----mr.smith, cse100,2018 fall,software engineering
CREATE TABLE faculty_class(
  idfaculty_class SERIAL PRIMARY KEY,
  idfaculty integer REFERENCES faculty(idfaculty) ON DELETE CASCADE ON UPDATE CASCADE,
  idclass integer REFERENCES class(idclass) ON DELETE CASCADE ON UPDATE CASCADE
 
  );

--michael, cse100,2018 fall,software engineering
CREATE TABLE student_class (
  idstudent_class SERIAL PRIMARY KEY,
  idstudent integer REFERENCES student(idstudent) ON DELETE CASCADE ON UPDATE CASCADE,
  idclass integer REFERENCES class(idclass) ON DELETE CASCADE ON UPDATE CASCADE,
  units integer NOT NULL,
  grade_option text NOT NULL,
  grade text NOT NULL
  );

--cse100, 2018 fall, software engineering, A01, 100wl
CREATE TABLE section (
  idsection SERIAL PRIMARY KEY,
  idclass integer REFERENCES class(idclass) ON DELETE CASCADE ON UPDATE CASCADE,
  max_enrollment integer NOT NULL,
  label text not null
  );

CREATE TABLE student_section (
  idstudent_section SERIAL PRIMARY KEY,
  idstudent integer REFERENCES student(idstudent) ON DELETE CASCADE ON UPDATE CASCADE,
  idsection integer REFERENCES section(idsection) ON DELETE CASCADE ON UPDATE CASCADE,
  is_waitlist text not null
  );
  
 
CREATE TABLE meeting_weekly (
  idmeeting_weekly SERIAL PRIMARY KEY,
  building text NOT NULL,
  room text NOT NULL,
  day_of_week integer NOT NULL,
  start_time time without time zone NOT NULL,
  end_time time without time zone NOT NULL,
  label text NOT NULL
  );

CREATE TABLE meeting_review_session (
  idmeeting_review_session SERIAL PRIMARY KEY,
  building text NOT NULL,
  room text NOT NULL,
  "date" integer NOT NULL,
  start_time time without time zone NOT NULL,
  end_time time without time zone NOT NULL
  );

CREATE TABLE section_weekly (
  idsection_weekly SERIAL PRIMARY KEY,
  idsection integer REFERENCES section(idsection) ON DELETE CASCADE ON UPDATE CASCADE,
  idmeeting_weekly integer REFERENCES meeting_weekly(idmeeting_weekly) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE section_review_session (
  idsection_review_session SERIAL PRIMARY KEY,
  idsection integer REFERENCES section(idsection) ON DELETE CASCADE ON UPDATE CASCADE,
  idmeeting_review_session integer REFERENCES meeting_review_session(idmeeting_review_session) ON DELETE CASCADE ON UPDATE CASCADE
  );


create table GRADE_CONVERSION(
LETTER_GRADE CHAR(2) NOT NULL,
NUMBER_GRADE DECIMAL(2,1)
);
insert into grade_conversion values('A+', 4.3);
insert into grade_conversion values('A', 4);
insert into grade_conversion values('A-', 3.7);
insert into grade_conversion values('B+', 3.4);
insert into grade_conversion values('B', 3.1);
insert into grade_conversion values('B-', 2.8);
insert into grade_conversion values('C+', 2.5);
insert into grade_conversion values('C', 2.2);
insert into grade_conversion values('C-', 1.9);
insert into grade_conversion values('D', 1.6);


CREATE TABLE faculty_section(
  idfaculty_section SERIAL PRIMARY KEY,
  idfaculty integer REFERENCES faculty(idfaculty) ON DELETE CASCADE ON UPDATE CASCADE,
  idsection integer REFERENCES section(idsection) ON DELETE CASCADE ON UPDATE CASCADE
 
  );







