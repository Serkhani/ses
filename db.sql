-- Proposed Schema from the requirements:

-- DepartmentTable
CREATE TABLE departments (
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(255) NOT NULL UNIQUE,
  head_of_department VARCHAR(255) NOT NULL,
  department_time_table VARCHAR(255)
);
-- Roles Table
CREATE TABLE roles (
  role_id SERIAL PRIMARY KEY,
  role_name VARCHAR(255) NOT NULL UNIQUE
);

-- Users Table
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  id INTEGER NOT NULL UNIQUE,
  pin INTEGER NOT NULL,
  role_id INTEGER REFERENCES roles (role_id)
);

-- Lecturer's table to store lecturer info
CREATE TABLE lecturers (
  lecturer_id SERIAL PRIMARY KEY REFERENCES users (user_id),
  course_id SERIAL PRIMARY KEY REFERENCES courses (course_id),
  department_id SERIAL PRIMARY KEY REFERENCES departments (department_id),
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  contact_number VARCHAR(20),
  gender VARCHAR(10) NOT NULL,
  profile_picture BYTEA
);


--Students table to store students details
CREATE TABLE students (
  user_id SERIAL PRIMARY KEY REFERENCES users (user_id),
  department VARCHAR(100) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  enrollment_date DATE NOT NULL,
  programme VARCHAR(100) NOT NULL,
  graduation_year INTEGER NOT NULL,
  address VARCHAR(255),
  contact_number VARCHAR(20),
  gender VARCHAR(10) NOT NULL,
  guardian_name VARCHAR(100),
  guardian_contact_number VARCHAR(20),
  profile_picture BYTEA
);


-- Courses Table
CREATE TABLE courses (
  course_id VARCHAR(255) PRIMARY KEY,--course id can be the course code
  course_name VARCHAR(255) NOT NULL UNIQUE,
  dept_id INTEGER REFERENCES departments (department_id),
  lecturer_id INTEGER REFERENCES lecturers (lecturer_id),
  creditHours INTEGER,
  description TEXT,
  semester VARCHAR(20),
  -- created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -- updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -- CONSTRAINT unique_course_code UNIQUE (course_id)
);
-- https://drive.google.com/file/d/1Q_to3eEclbWYnLFvpBCUjXsYbua5oVmb/view?usp=drive_link


-- Announcements Table
CREATE TABLE announcements (
  announcement_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  image BYTEA,-- an image for the announcement
  user_id INTEGER REFERENCES users (user_id)-- the sender of the announcement
);

-- Tasks Table
CREATE TABLE tasks (
  task_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users (user_id),
  task_title VARCHAR(255) NOT NULL,
  task_description TEXT,
  deadline DATE,
  completed BOOLEAN
);

-- Faults Table
CREATE TABLE faults (
  fault_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users (user_id),
  fault_type VARCHAR(255) NOT NULL,
  description TEXT,
  date_reported TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(255)
);

-- Assignments Table
CREATE TABLE assignments (
  assignment_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users (user_id),
  course_id VARCHAR(255) REFERENCES courses (course_id),
  assignment_title VARCHAR(255) NOT NULL,
  assignment_description TEXT,
  deadline DATE,
  status VARCHAR(255)
);

-- PastExamQuestions Table
CREATE TABLE past_exam_questions (
  paper_id SERIAL PRIMARY KEY,
  course_id  VARCHAR(255) REFERENCES courses (course_id),
  lecturer_id INTEGER REFERENCES users (user_id),
  year INTEGER
  pdf_file BYTEA
);

-- Textbooks Table
CREATE TABLE textbooks (
  textbook_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  publication_year INTEGER,
  description TEXT,
  thumbnail VARCHAR(255)
);

-- Clubs Table
CREATE TABLE clubs (
  club_id SERIAL PRIMARY KEY,
  club_name VARCHAR(255) NOT NULL UNIQUE,
  club_description TEXT
);

-- Dues Table
CREATE TABLE dues (
  dues_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users (user_id),
  amount NUMERIC(10,2),
  due_date DATE
);
