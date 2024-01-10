-----------------------------
---- 1 Course Entry----
-----------------------------
-- term --
CREATE TABLE term(
  term_id SERIAL PRIMARY KEY,
  year integer NOT NULL,
  quarter text NOT NULL
);

CREATE TABLE course (
  course_num text PRIMARY KEY,
  department text NOT NULL,
  has_lab text NOT NULL,
  grading_opt text NOT NULL
);

CREATE TABLE prereqs (
  prereq_id SERIAL PRIMARY KEY,
  course_id integer REFERENCES course(course_id),
  prereq_course integer REFERENCES course(course_id)
);

-- type bachelor, ms, phd
CREATE TABLE degree (
  degree_id SERIAL PRIMARY KEY,
  type text NOT NULL,
  total_units text NOT NULL,
  min_gpa double precision NOT NULL,
  name text NOT NULL
);
-------------------------
---- 2 class --
-------------------------
CREATE TABLE class (
  class_id SERIAL PRIMARY KEY,
  term_id integer REFERENCES term(term_id),
  course_id integer REFERENCES course(course_id),
  title text NOT NULL
);

--------4 faculty--------
-- department --
CREATE TABLE department (
  department_id SERIAL PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE faculty (
  faculty_name text NOT NULL UNIQUE PRIMARY KEY,
  title text NOT NULL,
  department_id integer REFERENCES department(department_id)
);



------------------------
---- 3 student ----
------------------------
CREATE TABLE student (
  student_id SERIAL PRIMARY KEY,
  SSN text NOT NULL,
  FIRSTNAME text NOT NULL,
  MIDDLENAME text,
  LASTNAME text NOT NULL,
  RESIDENCY text,
  ENROLLMENT text
);

CREATE TABLE previous_edu (
  previous_edu_id SERIAL PRIMARY KEY,
  degree text NOT NULL,
  name text NOT NULL,
  start_date time NOT NULL,
  end_date time NOT NULL
);

-- undergraduate --
CREATE TABLE undergraduate (
  undergrad_id SERIAL PRIMARY KEY,
  student_id integer REFERENCES student(student_id),
  COLLEGE text NOT NULL
);

CREATE TABLE undergrad_major(
  undergrad_major_id SERIAL PRIMARY KEY,
  undergrad_id integer REFERENCES undergraduate(undergrad_id),
  degree_id integer REFERENCES degree(degree_id),
  FIVEYEAR boolean NOT NULL
);

CREATE TABLE undergrad_minor(
  undergrad_minor_id SERIAL PRIMARY KEY,
  undergrad_id integer REFERENCES undergraduate(undergrad_id),
  degree_id integer REFERENCES degree(degree_id)
);

-- graduate ms--
-- type means ms or phd --
CREATE TABLE master(
  master_id SERIAL PRIMARY KEY,
  student_id integer REFERENCES student(student_id),
  program text NOT NULL, 
  DEPARTMENT text NOT NULL
);

-- phd student -- 
CREATE TABLE phd(
  phd_id SERIAL PRIMARY KEY,
  student_id integer REFERENCES student(student_id), 
  DEPARTMENT text NOT NULL,
  faculty_name text REFERENCES faculty(faculty_name),
  IS_CANDIDATE boolean NOT NULL
);

CREATE TABLE student_enrollment (
  student_enrollment_id SERIAL PRIMARY KEY,
  student_id integer REFERENCES student(student_id), 
  term_id integer REFERENCES term(term_id)
);



----5 course enrollment ----

CREATE TABLE class_section (
  class_section_id SERIAL PRIMARY KEY,
  class_id integer REFERENCES class(class_id),
  faculty_name text REFERENCES faculty(faculty_name),
  enrollment_limit integer NOT NULL,
  waitlist_count integer NOT NULL
);
-- type means le di
CREATE TABLE class_section_time(
  class_section_time_id SERIAL PRIMARY KEY,
  type text NOT NULL,
  class_section_id integer REFERENCES class_section(class_section_id),
  day_of_week integer NOT NULL,
  start_time time NOT NULL,
  end_time time NOT NULL,
  room text NOT NULL,
  building text NOT NULL
);

CREATE TABLE student_class_curr(
  student_class_curr_id SERIAL PRIMARY KEY,
  student_id integer REFERENCES student(student_id),
  class_section_id integer REFERENCES class_section(class_section_id),
  grade_option text NOT NULL,
  units integer NOT NULL
);

CREATE TABLE faculty_teach (
  faculty_teach_id SERIAL PRIMARY KEY,
  faculty_name text REFERENCES faculty(faculty_name),
  class_section_id integer REFERENCES class_section(class_section_id)
);



----6 classes taken in the past ---
CREATE TABLE student_class_past(
  student_class_past_id SERIAL PRIMARY KEY,
  student_id integer REFERENCES student(student_id),
  term_id integer REFERENCES term(term_id),
  course_id integer REFERENCES course(course_id),
  units integer NOT NULL,
  grades text NOT NULL
);




----7 Thesis Committe ----

CREATE TABLE student_tcommitte(
  student_tcommitte_id SERIAL PRIMARY KEY,
  phd_id integer REFERENCES phd(phd_id),
  faculty1 text REFERENCES faculty(faculty_name),
  faculty2 text REFERENCES faculty(faculty_name),
  faculty3 text REFERENCES faculty(faculty_name),
  faculty4 text REFERENCES faculty(faculty_name)
);


-------8 probation-------
CREATE TABLE probation (
  probation_id SERIAL PRIMARY KEY,
  student_id integer REFERENCES student(student_id),
  term_id integer REFERENCES term(term_id),
  reason text NOT NULL
);


------9 Review Session ----
CREATE TABLE review_session (
  review_id SERIAL PRIMARY KEY,
  class_section_id integer REFERENCES class_section(class_section_id),
  dates DATE NOT NULL,
  start_time time NOT NULL,
  end_time time NOT NULL,
  building text NOT NULL,
  room text NOT NULL
);



---- 10 degree --


-- mn mean major or minor --
CREATE TABLE bachelor_degree (
  degree_id integer PRIMARY KEY,
  major_or_minor text NOT NULL,
  upper_units integer NOT NULL,
  lower_units integer NOT NULL,
  transfer text NOT NULL,
  department text NOT NULL,
  min_grade not null
);

-- ms degree --
CREATE TABLE ms_degree (
  ms_degree_id SERIAL PRIMARY KEY,
  degree_id integer REFERENCES degree(degree_id),
  department_id integer REFERENCES department(department_id),
  concentration text NOT NULL,
  name text NOT NULL
);

-- phD degree --
CREATE TABLE phd_degree (
  phd_degree_id SERIAL PRIMARY KEY,
  degree_id integer REFERENCES degree(degree_id),
  department_id integer REFERENCES department(department_id),
  time_limit text NOT NULL,
  dissertation text NOT NULL,
  exam text NOT NULL,
  name text NOT NULL
);

CREATE TABLE ba_student_degree(
  ba_student_degree_id SERIAL PRIMARY KEY,
  undergrad_id integer REFERENCES undergraduate(undergrad_id),
  ba_degree_id integer REFERENCES bachelor_degree(ba_degree_id),
  gpa double precision NOT NULL
);

CREATE TABLE ms_student_degree(
  ms_student_degree_id SERIAL PRIMARY KEY,
  master_id integer REFERENCES master(master_id),
  ms_degree_id integer REFERENCES ms_degree(ms_degree_id),
  gpa double precision NOT NULL
);

CREATE TABLE phd_student_degree(
  phd_student_degree_id SERIAL PRIMARY KEY,
  phd_id integer REFERENCES phd(phd_id),
  phd_degree_id integer REFERENCES phd_degree(phd_degree_id),
  gpa double precision NOT NULL
);

