CREATE TABLE student (
  student_id text PRIMARY KEY,
  SSN text NOT NULL,
  FIRSTNAME text NOT NULL,
  MIDDLENAME text,
  LASTNAME text NOT NULL,
  RESIDENCY text,
  ENROLLMENT text
);


CREATE TABLE undergraduates (
  student_id text PRIMARY KEY,
  college text NOT NULL,
  major text NOT NULL,
  minor text,
  BSMS  text NOT NULL
);

CREATE TABLE graduates (
  student_id text PRIMARY KEY,
  department text NOT NULL
);

CREATE TABLE MS_graduates (
  student_id text PRIMARY KEY
);

CREATE TABLE PhD_graduates (
  student_id text PRIMARY KEY
  advisor text,
  candidacy text NOT NULL
);

CREATE TABLE bachelor_degree (
  degree_id integer PRIMARY KEY,
  major_or_minor text NOT NULL,
  upper_units integer NOT NULL,
  lower_units integer NOT NULL,
  transfer text NOT NULL,
  department text NOT NULL,
  min_grade text not null
);

CREATE TABLE ms_degree (
  degree_id integer PRIMARY KEY,
  department_id text not null,
  concentration text NOT NULL,
  concentration_units integer not null,
  min_grade text not null,
  thesis text not null
);

CREATE TABLE phd_degree (
  degree_id integer PRIMARY KEY,
  dissertation text not null,
  time_limit text NOT NULL,
  research_exam text NOT NULL,
  qualify_exam text not null,
  min_grade text NOT NULL,
  TA_req text not null
);

CREATE TABLE phd_degree_course (
  degree_id integer REFERENCES phd_degree(degree_id),
  course_req text REFERENCES course(course_num),
  PRIMARY KEY (degree_id, course_req)
);

CREATE TABLE term(
  label text primary key
);

CREATE TABLE probation (
  student_id text REFERENCES student(student_id),
  start_time text REFERENCES term(label),
  end_time text REFERENCES term(label),
  reason text NOT NULL,
  PRIMARY KEY (student_id,start_time,end_time)
);

CREATE TABLE attendance (
  student_id text REFERENCES student(student_id),
  start_time text REFERENCES term(label),
  end_time text REFERENCES term(label),
  PRIMARY KEY (student_id,start_time,end_time)
);

CREATE TABLE previous_edu (
  student_id text REFERENCES student(student_id),
  institution text NOT NULL,
  degree text ,
  start_date text not null,
  end_date text not null,
  PRIMARY KEY (student_id,start_date,end_date)
);

CREATE TABLE course (
  course_num text PRIMARY KEY,
  department text NOT NULL,
  has_lab text NOT NULL,
  grading_opt text NOT NULL
);

CREATE TABLE course_prereq (
  course_num text NOT NULL REFERENCES course(course_num),
  pre_requisite text NOT NULL REFERENCES course(course_num),
  PRIMARY KEY (course_num,pre_requisite)
);

CREATE TABLE course_consent (
  course_num text PRIMARY KEY,
  consent_needed text NOT NULL
);

CREATE TABLE course_change (
  course_from text NOT NULL,
  course_to text NOT NULL,
  PRIMARY KEY (course_from,course_to)
);

CREATE TABLE course_units (
  course_num text NOT NULL REFERENCES course(course_num),
  units integer NOT NULL,
  PRIMARY KEY (course_num,units)
);

CREATE TABLE faculty (
  faculty_name text primary key,
  faculty_title text NOT NULL,
  department text NOT NULL
);

CREATE TABLE faculty_teach (
  faculty_name text NOT NULL REFERENCES faculty(faculty_name),
  course_num text NOT NULL REFERENCES course(course_num),
  term text NOT NULL REFERENCES term(label),
  PRIMARY KEY (faculty_name, course_num,term)
);

CREATE TABLE committee_same_dept (
  student_id text NOT NULL REFERENCES student(student_id),
  faculty_name text NOT NULL REFERENCES faculty(faculty_name),
  PRIMARY KEY (student_id,faculty_name)
);

CREATE TABLE committee_diff_dept (
  student_id text NOT NULL REFERENCES student(student_id),
  faculty_name text NOT NULL REFERENCES faculty(faculty_name),
  PRIMARY KEY (student_id,faculty_name)
);

CREATE TABLE bachelor_degree_lower_req (
  degree_id integer NOT NULL REFERENCES bachelor_degree(degree_id),
  course_num text NOT NULL REFERENCES course(course_num),
  PRIMARY KEY (degree_id, course_num)
);

CREATE TABLE bachelor_degree_upper_core (
  degree_id integer NOT NULL REFERENCES bachelor_degree(degree_id),
  course_num text NOT NULL REFERENCES course(course_num),
  PRIMARY KEY (degree_id, course_num)
);

CREATE TABLE bachelor_degree_upper_elect (
  degree_id integer NOT NULL REFERENCES bachelor_degree(degree_id),
  course_num text NOT NULL REFERENCES course(course_num),
  PRIMARY KEY (degree_id, course_num)
);

CREATE TABLE class (
  course_num text NOT NULL REFERENCES course(course_num),
  term text NOT NULL REFERENCES term(label),
  faculty_name text NOT NULL references faculty(faculty_name),
  class_title text not null,
  waitlist integer,
  enrollment_lim integer,
  PRIMARY KEY (course_num, term, faculty_name)
);

CREATE TABLE section (
  section_id text primary key,
  section_type text NOT NULL,
  section_day text,
  section_date text,
  section_time text NOT NULL,
  building text NOT NULL,
  room text NOT NULL
);

CREATE TABLE class_section (
  course_num text NOT NULL REFERENCES course(course_num),
  term text NOT NULL REFERENCES term(label),
  faculty_name text NOT NULL references faculty(faculty_name),
  section_id text not null references section(section_id),
  PRIMARY KEY (course_num, term, faculty_name,section_id)
);

CREATE TABLE class_taken (
  student_id text NOT NULL REFERENCES student(student_id),
  term text NOT NULL REFERENCES term(label),
  course_num text NOT NULL REFERENCES course(course_num),
  grade text NOT NULL,
  PRIMARY KEY (student_id,course_num,term)
);

CREATE TABLE class_enrolled (
  student_id text NOT NULL REFERENCES student(student_id),
  course_num text NOT NULL REFERENCES course(course_num),
  PRIMARY KEY (student_id,course_num)
);

