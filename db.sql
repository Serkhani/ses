-- Proposed Schema from the requirements:

-- DepartmentTable
CREATE TABLE  IF NOT EXISTS departments (
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(255) NOT NULL UNIQUE,
  head_of_department VARCHAR(255) NOT NULL,
  department_time_table VARCHAR(255)
);
-- Roles Table
CREATE TABLE  IF NOT EXISTS  roles (
  role_id SERIAL PRIMARY KEY,
  role_name VARCHAR(255) NOT NULL -- only 3.. student, lecturer, management
);


-- Users Table
CREATE TABLE  IF NOT EXISTS users (
  user_id SERIAL NOT NULL PRIMARY KEY,
  login_id INTEGER NOT NULL UNIQUE,
  pin INTEGER NOT NULL,
  role_id SERIAL ,
	FOREIGN KEY(role_id) REFERENCES roles(role_id)
);

-- Courses Table
CREATE TABLE  IF NOT EXISTS courses (
  course_id SERIAL PRIMARY KEY,--course id can be the course code
  course_name VARCHAR(255) NOT NULL UNIQUE,
  department_id SERIAL ,
	FOREIGN KEY(department_id) REFERENCES departments (department_id),
  creditHours INTEGER,
  description TEXT,
  semester VARCHAR(20)
  -- created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -- updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -- CONSTRAINT unique_course_code UNIQUE (course_id)
);

-- Lecturer's table to store lecturer info
CREATE TABLE  IF NOT EXISTS lecturers (
  lecturer_id SERIAL PRIMARY KEY REFERENCES users (user_id),
  course_id SERIAL ,
	FOREIGN KEY(course_id) REFERENCES courses (course_id),
  department_id SERIAL ,
	FOREIGN KEY(department_id) REFERENCES departments (department_id),
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  contact_number VARCHAR(20),
  gender VARCHAR(10) NOT NULL,
  profile_picture BYTEA
);


--Students table to store students details
CREATE TABLE  IF NOT EXISTS students (
  user_id SERIAL PRIMARY KEY REFERENCES users (user_id),
  department_id SERIAL,
	FOREIGN KEY(department_id) REFERENCES departments (department_id),
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  enrollment_date DATE NOT NULL,
  programme VARCHAR(100) NOT NULL,
  graduation_year INTEGER NOT NULL,
  curr_year INTEGER NOT NULL,
  address VARCHAR(255),
  contact_number VARCHAR(20),
  gender VARCHAR(10) NOT NULL,
  guardian_name VARCHAR(100),
  guardian_contact_number VARCHAR(20),
  profile_picture BYTEA
);



-- https://drive.google.com/file/d/1Q_to3eEclbWYnLFvpBCUjXsYbua5oVmb/view?usp=drive_link


-- Announcements Table
CREATE TABLE  IF NOT EXISTS announcements (
  announcement_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  image BYTEA,-- an image for the announcement
  user_id INTEGER REFERENCES users (user_id)-- the sender(lecturer or management) of the announcement
);

-- Tasks Table
CREATE TABLE  IF NOT EXISTS tasks (
  task_id SERIAL PRIMARY KEY,
  user_id SERIAL,
	FOREIGN KEY (user_id) REFERENCES users (user_id),-- the task created by the specific user
  task_title VARCHAR(255) NOT NULL,
  task_description TEXT,
  deadline DATE,
  completed BOOLEAN
);

-- Faults Table
CREATE TABLE  IF NOT EXISTS faults (
    fault_id SERIAL PRIMARY KEY,
    fault_type VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(200),
    reported_by SERIAL, FOREIGN KEY(reported_by) REFERENCES users (user_id),-- the reporter
    date_reported DATE DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Open'
);


-- Assignments Table
CREATE TABLE  IF NOT EXISTS assignments (
  assignment_id SERIAL PRIMARY KEY,
  lecturer_id serial,
	FOREIGN KEY (lecturer_id) REFERENCES lecturers (lecturer_id),
  course_id serial, 
	FOREIGN KEY (course_id) REFERENCES courses (course_id),
  topic VARCHAR(255) NOT NULL,
  assignment_description TEXT,
  image BYTEA,
  deadline DATE,
  status VARCHAR(255) DEFAULT 'Open'
);

-- PastExamQuestions Table
CREATE TABLE  IF NOT EXISTS past_exam_questions (
  paper_id SERIAL PRIMARY KEY,
  course_id  SERIAL, 
	FOREIGN KEY(course_id) REFERENCES courses (course_id),
  lecturer_id SERIAL,
	FOREIGN KEY(lecturer_id) REFERENCES lecturers (lecturer_id),
  examination_year INTEGER,
  pdf_file BYTEA
);

-- Textbooks Table
CREATE TABLE  IF NOT EXISTS textbooks (
  textbook_id SERIAL PRIMARY KEY,
  course_id  SERIAL, 
	FOREIGN KEY(course_id) REFERENCES courses (course_id),
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  publication_year INTEGER,
  description TEXT,
  thumbnail BYTEA
);

-- Clubs Table
CREATE TABLE  IF NOT EXISTS clubs (
  club_id SERIAL PRIMARY KEY,
  club_name VARCHAR(255) NOT NULL UNIQUE,
  patron_id SERIAL,
	FOREIGN KEY(patron_id) REFERENCES lecturers (lecturer_id),
  club_description TEXT,
  logo BYTEA,
  member_count INT DEFAULT 0
);

-- Club Members
CREATE TABLE  IF NOT EXISTS club_members (
  member_id SERIAL PRIMARY KEY,
  user_id SERIAL,
	FOREIGN KEY(user_id) REFERENCES users (user_id),
  club_id SERIAL,
	FOREIGN KEY(club_id) REFERENCES clubs (club_id)
);

-- Dues Table
CREATE TABLE  IF NOT EXISTS dues (
  dues_id SERIAL PRIMARY KEY,
  user_id SERIAL,
	FOREIGN KEY(user_id) REFERENCES users (user_id),
  amount NUMERIC(10,2)
);
