-- Lecturer's table to store lecturer info
CREATE TABLE lecturers (
  lecturer_id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  department VARCHAR(100) NOT NULL,
  specialization VARCHAR(100),
  office_location VARCHAR(100),
  contact_number VARCHAR(20),
  date_of_birth DATE NOT NULL,
  gender VARCHAR(10) NOT NULL,
  profile_picture BYTEA
);


--Students table to store students details
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  student_password VARCHAR(255) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  student_id_number VARCHAR(20) NOT NULL,
  enrollment_date DATE NOT NULL,
  department VARCHAR(100) NOT NULL,
  programme VARCHAR(100) NOT NULL,
  graduation_year INTEGER NOT NULL,
  address VARCHAR(255),
  contact_number VARCHAR(20),
  date_of_birth DATE NOT NULL,
  gender VARCHAR(10) NOT NULL,
  guardian_name VARCHAR(100),
  guardian_contact_number VARCHAR(20),
  profile_picture BYTEA
);


-- Courses table to store info about courses 
CREATE TABLE courses (
  course_id SERIAL PRIMARY KEY,
  course_code VARCHAR(50) NOT NULL,
  course_name VARCHAR(255) NOT NULL,
  dept_id INTEGER REFERENCES students (student_id),
  department VARCHAR(100),
  description TEXT,
  credit_hours INTEGER,
  semester VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_course_code UNIQUE (course_code)
);


-- Announcements table to store announcements
CREATE TABLE announcements (
  announcement_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  announcement TEXT,
  category VARCHAR(50)
);


-- Table to track user read/unread announcements
CREATE TABLE user_announcements (
  student_id INTEGER REFERENCES students (student_id),
  announcement_id INTEGER REFERENCES announcements (announcement_id),
  read_status VARCHAR(10),
  PRIMARY KEY (student_id, announcement_id)
);


-- Table to store timetable
CREATE TABLE timetables (
  timetable_id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students (student_id),
  course_id INTEGER,
  class_location VARCHAR(100),
  lecturer_name VARCHAR(100),
  start_time TIME,
  end_time TIME
);


-- Table to store info about events
CREATE TABLE events (
  event_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  event_date DATE,
  event_time TIME,
  event_location VARCHAR(100)
);


-- Table to store tasks
CREATE TABLE tasks (
  task_id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students (student_id),
  task_description TEXT,
  due_date DATE,
  completed BOOLEAN
);


-- Table to track fault reports
CREATE TABLE fault_reports (
  report_id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students (student_id),
  description TEXT,
  image VARCHAR(255),
  category VARCHAR(50),
  submitted_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  resolved BOOLEAN,
  resolved_date TIMESTAMP
);


-- Table to track assignments
CREATE TABLE assignments (
  assignment_id SERIAL PRIMARY KEY,
  dept_id INTEGER REFERENCES students (student_id),
  course_id INTEGER REFERENCES courses (course_id),
  title VARCHAR(255) NOT NULL,
  description TEXT,
  deadline TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT check_deadline CHECK (deadline > NOW())
);


-- Table to track assignment submissions
CREATE TABLE submissions (
  submission_id SERIAL PRIMARY KEY,
  assignment_id INTEGER REFERENCES assignments (assignment_id),
  student_id INTEGER REFERENCES students (student_id),
  submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  file_path VARCHAR(255),
  score INTEGER,
  feedback TEXT,
  CONSTRAINT check_score CHECK (score >= 0 AND score <= 100)
);


-- Table to store exam past questions files
CREATE TABLE exam_past_questions (
  question_id SERIAL PRIMARY KEY,
  course_id INTEGER REFERENCES courses (course_id),
  file_name VARCHAR(255),
  file_data BYTEA
);


-- Table to store textbook files and infos
CREATE TABLE textbooks (
  textbook_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255),
  publication_date DATE,
  textbook BYTEA
);


-- Table to hold info about student clubs
CREATE TABLE clubs (
  club_id SERIAL PRIMARY KEY,
  club_name VARCHAR(255) NOT NULL,
  description TEXT
);


-- Table to hold info about clubs joined by student
CREATE TABLE club_memberships (
  membership_id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students (student_id),
  club_id INTEGER REFERENCES clubs (club_id),
  joined_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Table to track club dues paid by student
CREATE TABLE dues (
  dues_id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students (student_id),
  club_id INTEGER REFERENCES clubs (club_id),
  amount DECIMAL(10, 2) NOT NULL,
  payment_status VARCHAR(20) NOT NULL,
  payment_date DATE
);
