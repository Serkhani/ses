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
  user_id INTEGER NOT NULL UNIQUE PRIMARY KEY,
  pin VARCHAR(255) NOT NULL,
  role_id SERIAL ,
	FOREIGN KEY(role_id) REFERENCES roles(role_id)
);

-- Courses Table
CREATE TABLE  IF NOT EXISTS courses (
  course_id VARCHAR(7) PRIMARY KEY,--course id can be the course code
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
  course_id VARCHAR(7) ,
	FOREIGN KEY(course_id) REFERENCES courses (course_id),
  department_id SERIAL ,
	FOREIGN KEY(department_id) REFERENCES departments (department_id),
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  contact_number VARCHAR(20),
  gender VARCHAR(10) NOT NULL,
  profile_picture TEXT
);


--Students table to store students details
CREATE TABLE  IF NOT EXISTS students (
  user_id INTEGER PRIMARY KEY REFERENCES users (user_id),
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
  profile_picture TEXT
);



-- https://drive.google.com/file/d/1Q_to3eEclbWYnLFvpBCUjXsYbua5oVmb/view?usp=drive_link


-- Announcements Table
CREATE TABLE  IF NOT EXISTS announcements (
  announcement_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  image VARCHAR(200),-- an image for the announcement
  user_id INTEGER, FOREIGN KEY(user_id) REFERENCES users (user_id)-- the sender(lecturer or management) of the announcement
);

-- Tasks Table
CREATE TABLE  IF NOT EXISTS tasks (
  task_id SERIAL PRIMARY KEY,
  user_id INTEGER,
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
  course_id VARCHAR(7), 
	FOREIGN KEY (course_id) REFERENCES courses (course_id),
  topic VARCHAR(255) NOT NULL,
  assignment_description TEXT,
  image BYTEA,
  deadline DATE,
  status VARCHAR(10) DEFAULT 'Open'
);

-- PastExamQuestions Table
CREATE TABLE  IF NOT EXISTS past_exam_questions (
  paper_id SERIAL PRIMARY KEY,
  course_id  VARCHAR(7), 
	FOREIGN KEY(course_id) REFERENCES courses (course_id),
  lecturer_id SERIAL,
	FOREIGN KEY(lecturer_id) REFERENCES lecturers (lecturer_id),
  examination_year INTEGER,
  pdf_file TEXT
);

-- Textbooks Table
CREATE TABLE  IF NOT EXISTS textbooks (
  textbook_id SERIAL PRIMARY KEY,
  course_id  VARCHAR(7), 
	FOREIGN KEY(course_id) REFERENCES courses (course_id),
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  publication_year INTEGER,
  description TEXT,
  thumbnail TEXT
);

-- Clubs Table
CREATE TABLE  IF NOT EXISTS clubs (
  club_id SERIAL PRIMARY KEY,
  club_name VARCHAR(255) NOT NULL UNIQUE,
  patron_id SERIAL,
	FOREIGN KEY(patron_id) REFERENCES lecturers (lecturer_id),
  club_description TEXT,
  logo TEXT,
  member_count INT DEFAULT 0
);

-- Club Members
CREATE TABLE  IF NOT EXISTS club_members (
  member_id SERIAL PRIMARY KEY,
  user_id INTEGER,
	FOREIGN KEY(user_id) REFERENCES users (user_id),
  club_id SERIAL,
	FOREIGN KEY(club_id) REFERENCES clubs (club_id)
);

-- Dues Table
CREATE TABLE  IF NOT EXISTS dues (
  dues_id SERIAL PRIMARY KEY,
  user_id INTEGER,
	FOREIGN KEY(user_id) REFERENCES users (user_id),
  amount NUMERIC(10,2)
);





INSERT INTO departments (department_name, head_of_department, department_time_table) VALUES ('Computer Engineering', 'John Smith', 'https://t3.ftcdn.net/jpg/05/19/19/84/360_F_519198427_nzaV8mnSi79IshHTVY8SLhYZklPqe2yk.jpg');
INSERT INTO departments (department_name, head_of_department, department_time_table) VALUES ('Biomedical Engineering', 'Sarah Johnson', 'https://t3.ftcdn.net/jpg/05/19/19/84/360_F_519198427_nzaV8mnSi79IshHTVY8SLhYZklPqe2yk.jpg');
INSERT INTO departments (department_name, head_of_department, department_time_table) VALUES ('Food Processing Engineering', 'Michael Lee', 'https://t3.ftcdn.net/jpg/05/19/19/84/360_F_519198427_nzaV8mnSi79IshHTVY8SLhYZklPqe2yk.jpg');
INSERT INTO departments (department_name, head_of_department, department_time_table) VALUES ('Agricultural Engineering', 'David Williams', 'https://t3.ftcdn.net/jpg/05/19/19/84/360_F_519198427_nzaV8mnSi79IshHTVY8SLhYZklPqe2yk.jpg');
INSERT INTO departments (department_name, head_of_department, department_time_table) VALUES ('Material Science Engineering', 'Emily Brown', 'https://t3.ftcdn.net/jpg/05/19/19/84/360_F_519198427_nzaV8mnSi79IshHTVY8SLhYZklPqe2yk.jpg');


INSERT INTO roles (role_name) VALUES ('student');
INSERT INTO roles (role_name) VALUES ('lecturer');
INSERT INTO roles (role_name) VALUES ('management');

INSERT INTO users (user_id, role_id, pin) VALUES (10912345,  1,'$2a$07$z/hr8IwAS04PsSf0k5gTGuHRMDI03l75BgWPnvNt7lOO2qDgeLR/O');
INSERT INTO users (user_id, role_id, pin) VALUES (10923456,  2,'$2a$07$7MmPceXp8ynWRyv5vhNyKOf7Z8P4fjuwX5X.sOCCIsjI4d6nniKXG');
INSERT INTO users (user_id, role_id, pin) VALUES (10934567,  3,'$2a$07$dMU9bzOMkPxOyXGjz2UqneStNB4HXEbEDOBMupOTS5ByRuVZWzf7m');
INSERT INTO users (user_id, role_id, pin) VALUES (10945678,  1,'$2a$07$DrNFZUHeMwLTUwt7z7Xh4ulrKBxqz8P4A5BGGziP4bl4Eg3FEx6Ne');
INSERT INTO users (user_id, role_id, pin) VALUES (10956789,  2,'$2a$07$n8x6iJDIjT6z7ak4.8r0V.qoJ9lWh3LKJhwRvDdPbYsxrAnhSxt2S');
INSERT INTO users (user_id, role_id, pin) VALUES (10967890,  3,'$2a$07$6oZZX97eM8Ovu/fP9Nw8jeYj/whyWLeTxk7PTzojqpRNIX0uHLaDy');
INSERT INTO users (user_id, role_id, pin) VALUES (10901234,  1,'$2a$07$7fbls7255V4cxlih4MPczOTwFkrET0M/SuH2B3d8zzDum7LV687gq');
INSERT INTO users (user_id, role_id, pin) VALUES (10909876,  2,'$2a$07$fjf0ixCiUrVmhu6eJl9S.us4kCTK0VPgdEZsZiXV9kJQMKE19A5g6');
INSERT INTO users (user_id, role_id, pin) VALUES (10998765,  3,'$2a$07$vYOsMSgdoPXDXS8pV/PtfukvkDJRQkUC8RUs7MyW5TOOPfhnt6P2.');
INSERT INTO users (user_id, role_id, pin) VALUES (10987654,  1,'$2a$07$uHzXD6xxzn0VWz8w69uQfuva4HIXSGA559hQf2bCs7hqkBvQ16QE6');

 INSERT INTO courses (course_id, course_name, department_id, creditHours, description, semester) 
VALUES 
  ('CPEN101','Introduction to Computer Science', 1, 3, 'An introductory course to computer science.', '1'),
  ('CPEN201','Calculus I', 2, 4, 'A course on differential and integral calculus.', '2'),
  ('CPEN102','Physics Fundamentals', 3, 3, 'An introductory course to fundamental physics principles.', '1'),
  ('CPEN103','Advanced English Writing', 4, 3, 'A course focused on advanced writing skills.', '1'),
  ('CPEN202','Introduction to Chemistry', 3, 4, 'An introductory course to basic chemistry concepts.', '2'),
  ('CPEN104','World History', 5, 3, 'A course covering significant historical events from around the world.', '1'),
  ('CPEN203','Introduction to Psychology', 4, 3, 'An introductory course to basic psychology concepts.', '2'),
  ('CPEN105','Modern Art', 2, 3, 'A course exploring modern art movements and artists.', '1'),
  ('CPEN204','Biology Basics', 3, 4, 'An introductory course to basic biological concepts.', '2'),
  ('CPEN106','Microeconomics', 1, 3, 'A course focused on microeconomic principles.', '1');

  INSERT INTO lecturers (lecturer_id, course_id, department_id, full_name, email, contact_number, gender,profile_picture) 
VALUES 
  (10923456, 'CPEN101',1, 'John Doe', 'john.doe@example.com', '123-456-7890', 'Male', 'https://drive.google.com/uc?export=download&id=1hCcyT3_CKs4Jz36wFe63wryjKj6tephK'),
  (10956789, 'CPEN201',3, 'Robert Lee', 'robert.lee@example.com', '444-444-4444', 'Male', 'https://drive.google.com/uc?export=download&id=1NSRs80le7uwnQxM3LmCBJG4U3HkJfEkj'),
  -- (10909876, 'CPEN102',2, 'Jane Smith', 'jane.smith@example.com', '987-654-3210', 'Female', 'https://drive.google.com/uc?export=download&id=1hCcyT3_CKs4Jz36wFe63wryjKj6tephK'),
  -- (10923456, 'CPEN103',3, 'Michael Johnson', 'michael.johnson@example.com', '555-555-5555', 'Male', 'https://drive.google.com/uc?export=download&id=1phyn0KYjOdg362mwFLobULpGYFEqDsAk'),
  -- (10956789, 'CPEN202',4, 'Emily Brown', 'emily.brown@example.com', '111-222-3333', 'Female', 'https://drive.google.com/uc?export=download&id=1hCcyT3_CKs4Jz36wFe63wryjKj6tephK'),
  -- (10909876, 'CPEN104',5, 'Sophia Wilson', 'sophia.wilson@example.com', '777-777-7777', 'Female', 'https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX'),
  -- (10923456, 'CPEN203',4, 'William Davis', 'william.davis@example.com', '888-888-8888', 'Male', 'https://drive.google.com/uc?export=download&id=15es2WWDFFua8hQWk4jGPz_h4F8RrW4og'),
  -- (10956789, 'CPEN105',2, 'Olivia Martinez', 'olivia.martinez@example.com', '999-999-9999', 'Female', 'https://drive.google.com/uc?export=download&id=1twJSQ8y7-nWXyyQnDhrFzssj81Kkhz7F'),
  -- (10909876, 'CPEN204',1, 'James Garcia', 'james.garcia@example.com', '222-222-2222', 'Male', 'https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ'),
  (10909876, 'CPEN106',3, 'Ava Rodriguez', 'ava.rodriguez@example.com', '333-333-3333', 'Female', 'https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ');


INSERT INTO students (user_id, department_id, full_name, email, enrollment_date, programme, graduation_year, curr_year, address, contact_number, gender, guardian_name, guardian_contact_number,profile_picture ) 
VALUES 
  (10912345, 1, 'John Doe', 'john.doe@example.com', '2020-09-01', 'Computer Science', 2024, 3, '123 Main St, City', '123-456-7890', 'Male', 'Mary Doe', '987-654-3210', 'https://drive.google.com/uc?export=download&id=1hCcyT3_CKs4Jz36wFe63wryjKj6tephK'),
  (10945678, 2, 'Jane Smith', 'jane.smith@example.com', '2019-08-15', 'Electrical Engineering', 2023, 4, '456 Oak Ave, Town', '555-555-5555', 'Female', 'David Smith', '111-222-3333', 'https://drive.google.com/uc?export=download&id=1NSRs80le7uwnQxM3LmCBJG4U3HkJfEkj'),
  (10901234, 3, 'Michael Johnson', 'michael.johnson@example.com', '2021-01-10', 'Mechanical Engineering', 2025, 2, '789 Elm Rd, Village', '444-444-4444', 'Male', 'Susan Johnson', '777-777-7777', 'https://drive.google.com/uc?export=download&id=1hCcyT3_CKs4Jz36wFe63wryjKj6tephK'),
  (10987654, 4, 'Emily Brown', 'emily.brown@example.com', '2022-03-20', 'Biology', 2026, 1, '321 Pine Ln, County', '888-888-8888', 'Female', 'James Brown', '999-999-9999', 'https://drive.google.com/uc?export=download&id=1phyn0KYjOdg362mwFLobULpGYFEqDsAk');
  -- (10912345, 3, 'Robert Lee', 'robert.lee@example.com', '2023-09-05', 'Civil Engineering', 2027, 1, '987 Maple Blvd, City', '222-222-2222', 'Male', 'Linda Lee', '333-333-3333', 'https://drive.google.com/uc?export=download&id=1hCcyT3_CKs4Jz36wFe63wryjKj6tephK'),
  -- (10945678, 5, 'Sophia Wilson', 'sophia.wilson@example.com', '2020-08-28', 'Business Administration', 2024, 3, '654 Oak Rd, Town', '444-444-4444', 'Female', 'Michael Wilson', '666-666-6666', 'https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX'),
  -- (10901234, 4, 'William Davis', 'william.davis@example.com', '2022-01-15', 'Psychology', 2026, 1, '789 Elm St, Village', '555-555-5555', 'Male', 'Karen Davis', '111-111-1111', 'https://drive.google.com/uc?export=download&id=15es2WWDFFua8hQWk4jGPz_h4F8RrW4og'),
  -- (10987654, 2, 'Olivia Martinez', 'olivia.martinez@example.com', '2021-03-10', 'Fine Arts', 2025, 2, '123 Cedar Ave, County', '777-777-7777', 'Female', 'Carlos Martinez', '222-222-2222', 'https://drive.google.com/uc?export=download&id=1twJSQ8y7-nWXyyQnDhrFzssj81Kkhz7F'),
  -- (10912345, 3, 'James Garcia', 'james.garcia@example.com', '2023-09-01', 'Chemistry', 2027, 1, '456 Oak St, City', '888-888-8888', 'Male', 'Maria Garcia', '999-999-9999', 'https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ'),
  -- (10945678, 1, 'Ava Rodriguez', 'ava.rodriguez@example.com', '2020-08-15', 'Environmental Science', 2024, 3, '987 Pine Rd, Town', '666-666-6666', 'Female', 'Juan Rodriguez', '333-333-3333', 'https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ');


-- CREATE TABLE  IF NOT EXISTS announcements (
--   announcement_id SERIAL PRIMARY KEY,
--   title VARCHAR(255) NOT NULL,
--   content TEXT,
--   date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   image VARCHAR(200),-- an image for the announcement
--   user_id INTEGER, FOREIGN KEY(user_id) REFERENCES users (user_id)-- the sender(lecturer or management) of the announcement
-- );


 -- Announcement 1
INSERT INTO announcements (title, content,date_created,image, user_id)
VALUES 
('Career Fair 2023', 'We are excited to announce that the Career Fair 2023 will be held on March 10th. It will provide an excellent opportunity for students to connect with leading companies and explore potential job opportunities. Do not miss this event!','2023-07-25','https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX', 10923456),
('Library Renovation', 'Dear students, the university library will undergo renovation from April to July. During this period, some sections may be temporarily closed. We apologize for any inconvenience caused and appreciate your understanding.','2023-07-26','https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX', 10934567),
('Volunteer Opportunity', 'We are looking for volunteers to participate in the community cleanup drive on April 22nd. Let contribute to making our neighborhood cleaner and greener. Sign up at the Student Affairs Office!','2023-07-27','https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX', 10956789),
('Guest Lecture Series', 'The Guest Lecture Series continues with a talk on Environmental Sustainability by Dr. David Green. Join us on May 5th at 3 PM in the auditorium to learn about sustainable practices and conservation efforts.','2023-07-28','https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX', 10967890),
('Student Association Elections', 'Attention all students! Nominations for the Student Association Elections are now open. If you are interested in representing your fellow students, submit your nomination by May 15th at the Student Affairs Office.','2023-07-29','https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX', 10909876),
('Midterm Examinations', 'Dear students, the midterm examinations for the current semester will start from June 1st. Make sure to review your course materials and prepare thoroughly for the exams. Good luck!','2023-08-01','https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX', 10998765),
('Sports Day 2023', 'Mark your calendars for Sports Day 2023 on June 15th. It will be a day filled with exciting sports events and competitions. Gather your team and participate in friendly matches.','2023-08-02','https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX', 10923456),
('Art Exhibition', 'The Annual Art Exhibition will be held from July 5th to July 15th in the Fine Arts Building. Come and appreciate the creative works of our talented students and faculty.','2023-08-03','https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX', 10934567),
('Summer Internship Opportunities', 'Attention final-year students! Explore the various summer internship opportunities available at renowned companies. Check the Career Services Portal for more details and application deadlines.','2023-08-05','https://drive.google.com/uc?export=download&id=1_9wFsCZPbxzU9dNa4Q5r3iY1CzBzHwsX', 10956789),
('Workshop on Effective Communication', 'Enhance your communication skills with our upcoming workshop on July 20th. Learn essential techniques for effective public speaking and interpersonal communication. Register at the Communication Studies Department.','2023-07-25','https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ', 10967890),
('Library Renovation', 'Dear students, the university library will undergo renovation from April to July. During this period, some sections may be temporarily closed. We apologize for any inconvenience caused and appreciate your understanding.','2023-07-26','https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ', 10909876),
('Volunteer Opportunity', 'We are looking for volunteers to participate in the community cleanup drive on April 22nd. Lets contribute to making our neighborhood cleaner and greener. Sign up at the Student Affairs Office!','2023-07-27','https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ', 10998765),
('Guest Lecture Series', 'The Guest Lecture Series continues with a talk on Environmental Sustainability by Dr. David Green. Join us on May 5th at 3 PM in the auditorium to learn about sustainable practices and conservation efforts.','2023-07-28','https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ', 10923456),
('Student Association Elections', 'Attention all students! Nominations for the Student Association Elections are now open. If you are interested in representing your fellow students, submit your nomination by May 15th at the Student Affairs Office.','2023-07-29','https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ', 10934567),
('Midterm Examinations', 'Dear students, the midterm examinations for the current semester will start from June 1st. Make sure to review your course materials and prepare thoroughly for the exams. Good luck!','2023-08-01','https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ', 10956789),
('Sports Day 2023', 'Mark your calendars for Sports Day 2023 on June 15th. It will be a day filled with exciting sports events and competitions. Gather your team and participate in friendly matches.','2023-08-02','https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ', 10967890),
('Art Exhibition', 'The Annual Art Exhibition will be held from July 5th to July 15th in the Fine Arts Building. Come and appreciate the creative works of our talented students and faculty.','2023-08-03','https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ', 10909876),
('Summer Internship Opportunities', 'Attention final-year students! Explore the various summer internship opportunities available at renowned companies. Check the Career Services Portal for more details and application deadlines.','2023-08-05','https://drive.google.com/uc?export=download&id=1GouBHndJR2T4uMiuKOQDcVGtcX3uP-eJ', 10998765);

-- Announcement 10
-- 
-- ,('Workshop on Effective Communication', 'Enhance your communication skills with our upcoming workshop on July 20th. Learn essential techniques for effective public speaking and interpersonal communication. Register at the Communication Studies Department.', 4);

-- [23/07, 13:46] Nicole: -- Task 6
INSERT INTO tasks (user_id, task_title, task_description, deadline, completed)
VALUES (10912345, 'Research Project Literature Review', 'Conduct a literature review for the research project and compile relevant articles.', '2023-08-05', false),
 (10912345, 'Math Quiz Practice', 'Practice solving math problems for the upcoming quiz to reinforce concepts.', '2023-07-31', false),
 (10945678, 'Art Portfolio Submission', 'Prepare and submit your art portfolio for the semester evaluation.', '2023-08-10', false),
 (10901234, 'Biology Lab Report', 'Write the lab report based on the findings from the recent biology experiment.', '2023-08-03', false),
 (10987654, 'Internship Application', 'Complete and submit the internship application form to the Career Services Office.', '2023-08-15', false),
 (10912345, 'Review Peer Presentations', 'Provide feedback on peer presentations for the group project.', '2023-08-08', false),
 (10945678, 'Chemistry Lab Preparation', 'Gather the necessary chemicals and equipment for the upcoming chemistry lab session.', '2023-07-30', false),
 (10901234, 'Study Guide Creation', 'Create a study guide for the final exam covering all key topics.', '2023-08-12', false),
 (10987654, 'Data Analysis for Research', 'Analyze the data collected for the research project using statistical software.', '2023-08-18', false),
 (10945678, 'Mock Interview Practice', 'Participate in mock interviews to improve your interview skills.', '2023-07-29', false);

-- [23/07, 13:49] Nicole: -- Fault 1
INSERT INTO faults (fault_type, description, location, reported_by, date_reported, status)
VALUES ('Electrical', 'Power outage in Room 101. Lights and sockets are not functioning.', 'Building A, Room 101', 10912345, '2023-07-25', 'Open'),
('Plumbing', 'Water leakage in the restroom on the second floor. Please address immediately.', 'Building B, 2nd Floor Restroom', 10945678, '2023-07-26', 'Open'),
('HVAC', 'Air conditioning system malfunction in the lecture hall. Room temperature is too high.', 'Building C, Lecture Hall', 10901234, '2023-07-27', 'Closed'),
('Security', 'Main gate entrance door does not close properly. Security concern for the campus.', 'Main Entrance', 10987654, '2023-07-28', 'Open'),
('IT', 'Computer lab printer not working. Needs immediate attention.', 'Computer Lab, Room 201', 10912345, '2023-07-29', 'Open'),
('Electrical', 'No power in the library. Lights and computers are down.', 'Library, Ground Floor', 10923456, '2023-08-01', 'Closed'),
('Plumbing', 'Water leakage in the cafeteria kitchen. Caution required.', 'Cafeteria, Kitchen Area', 10956789, '2023-08-02', 'Open'),
('HVAC', 'Air conditioning unit making loud noise in the faculty lounge. Disturbing the occupants.', 'Faculty Lounge, Building D', 10909876, '2023-08-03', 'Open'),
('Security', 'Broken lock on Room 205. Needs immediate repair.', 'Building E, Room 205', 10998765, '2023-08-04', 'Open'),
('IT', 'Network connectivity issue in the dormitory. Students unable to access the internet.', 'Dormitory, Student Wing', 10987654, '2023-08-05', 'Closed');


-- Assignment 1
INSERT INTO assignments (lecturer_id, course_id, topic, assignment_description, deadline, status)
VALUES (10923456, 'CPEN101', 'Programming Basics', 'Write a program in Python that calculates the factorial of a given number.', '2023-08-10', 'Open'),
(10956789, 'CPEN101','Integration Techniques', 'Solve the definite integral using appropriate integration techniques.', '2023-07-30', 'Open'),
(10909876, 'CPEN201','Newtons Laws of Motion', 'Explain Newtons three laws of motion with real-world examples.', '2023-08-05', 'Open'),
(10923456, 'CPEN101','Essay on Linguistics', 'Write an essay discussing the impact of language on culture and society.', '2023-08-15', 'Closed'),
(10956789, 'CPEN202','Chemical Reactions', 'Balancing chemical equations and identifying reaction types.', '2023-09-05', 'Open'),
(10909876, 'CPEN201','Historical Events Analysis', 'Analyze the impact of a significant historical event on modern society.', '2023-08-20', 'Open'),
(10923456, 'CPEN101','Psychological Case Study', 'Conduct a case study on a selected individual to explore psychological traits and behaviors.', '2023-08-25', 'Open'),
(10956789, 'CPEN202','Art Movements Presentation', 'Prepare a presentation on a major art movement of the 20th century.', '2023-08-18', 'Open'),
(10909876, 'CPEN101','Biodiversity Research', 'Research and document the biodiversity in a local ecological habitat.', '2023-08-12', 'Closed');
-- (10, 'CPEN201', 'Market Analysis Report', 'Conduct a market analysis for a specific product or service.', '2023-08-15', 'Closed');
-- VALUES (1, 'CPEN101', 'Programming Basics', 'Write a program in Python that calculates the factorial of a given number.', '2023-08-10', 'Open'),
-- (2, 'CPEN101','Integration Techniques', 'Solve the definite integral using appropriate integration techniques.', '2023-07-30', 'Open'),
-- (3, 'CPEN201','Newtons Laws of Motion', 'Explain Newtons three laws of motion with real-world examples.', '2023-08-05', 'Open'),
-- (4, 'CPEN101','Essay on Linguistics', 'Write an essay discussing the impact of language on culture and society.', '2023-08-15', 'Closed'),
-- (5, 'CPEN202','Chemical Reactions', 'Balancing chemical equations and identifying reaction types.', '2023-09-05', 'Open'),
-- (6, 'CPEN201','Historical Events Analysis', 'Analyze the impact of a significant historical event on modern society.', '2023-08-20', 'Open'),
-- (7, 'CPEN101','Psychological Case Study', 'Conduct a case study on a selected individual to explore psychological traits and behaviors.', '2023-08-25', 'Open'),
-- (8, 'CPEN202','Art Movements Presentation', 'Prepare a presentation on a major art movement of the 20th century.', '2023-08-18', 'Open'),
-- (9, 'CPEN101','Biodiversity Research', 'Research and document the biodiversity in a local ecological habitat.', '2023-08-12', 'Closed'),
-- (10, 'CPEN201', 'Market Analysis Report', 'Conduct a market analysis for a specific product or service.', '2023-08-15', 'Closed');


-- [23/07, 13:53] Nicole: -- Past Exam Question 1
INSERT INTO past_exam_questions (course_id, lecturer_id, examination_year, pdf_file)
VALUES ('CPEN101', 10909876,  2022, 'https://drive.google.com/file/d/1CjvyzpdzYDDvZjhcRe2xKLWCF8wgxG68/view?usp=sharing'),
('CPEN101', 10923456,  2021, 'https://drive.google.com/file/d/19pefn5yb9Ml1I5pd9S2yAZabZ7DvnUic/view?usp=sharing'),
('CPEN201', 10956789,  2020, 'https://drive.google.com/file/d/1lHwNg6Q4KiPcJjuk5dsyr5lBTIfTVkCE/view?usp=drive_link'),
('CPEN101', 10909876,  2019, 'https://drive.google.com/file/d/1lHwNg6Q4KiPcJjuk5dsyr5lBTIfTVkCE/view?usp=drive_link'),
('CPEN202', 10923456,  2018, 'https://drive.google.com/file/d/1CjvyzpdzYDDvZjhcRe2xKLWCF8wgxG68/view?usp=sharing'),
('CPEN201', 10956789,  2020, 'https://drive.google.com/file/d/19pefn5yb9Ml1I5pd9S2yAZabZ7DvnUic/view?usp=drive_link'),
('CPEN101', 10909876,  2019, 'https://drive.google.com/file/d/1CjvyzpdzYDDvZjhcRe2xKLWCF8wgxG68/view?usp=sharing'),
('CPEN202', 10923456,  2018, 'https://drive.google.com/file/d/1lHwNg6Q4KiPcJjuk5dsyr5lBTIfTVkCE/view?usp=drive_link'),
('CPEN101', 10956789,  2017, 'https://drive.google.com/file/d/19pefn5yb9Ml1I5pd9S2yAZabZ7DvnUic/view?usp=sharing'),
('CPEN201', 10909876,  2016, 'https://drive.google.com/file/d/1CjvyzpdzYDDvZjhcRe2xKLWCF8wgxG68/view?usp=sharing');


-- [23/07, 13:53] Nicole: -- Textbook 1
INSERT INTO textbooks (course_id, title, author, publication_year, description, thumbnail)
VALUES ('CPEN101', 'Python Crash Course', 'Eric Matthes', 2021, 'A beginner-friendly guide to programming in Python.', 'https://learning.oreilly.com/library/cover/9781492071266/250w/'),
('CPEN101', 'Calculus: Early Transcendentals', 'James Stewart', 2019, 'A comprehensive textbook covering calculus topics.', 'https://www.google.com/search?sxsrf=AB5stBgkNxu3bupXVkr5r5cx8jugF2wNnw:1690488880941&si=ACFMAn9guiESjt3hsdqUPIy1y2qa0157EysY45UH-07krUGxznBZFayDk8p1Z7oigqTv8QEbXa1kVQvGhJehxMJKb9ILaKbZhSURiPh6MPUDtL6_cCRMLLgDE1qwm3pNjGf43gSfITG0Oo15f8XufMCFTu3LWtgL7-dntKxB49hb4nTaw8C8cFhAl6i92kTefeYlLWmuWOi3E8IgVr1gSSrD-h0pwrAuIBzYZWUjcKpd7y6pAiUuvCwYKiPQ-YR5ebWEBWIteXf66Q5obRBmUmnmx7xx7pPLzNpv0BZlICn_eW9M8yPZknwErg7iFOdjjbM6MZz68SUR&q=Calculus+-+Stewart&sa=X&ved=2ahUKEwiS5frp2a-AAxWZ_7sIHXohCHMQs9oBKAB6BAhVEAI&biw=1600&bih=789&dpr=1#'),
('CPEN201', 'Physics for Scientists and Engineers', 'Serway & Jewett', 2020, 'A textbook on physics principles for science and engineering students.', 'https://books.google.com.gh/books/publisher/content?id=bfoWAAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE71qa117Q98nr7jjXgl7EVES6QPF351A8b1mu7cECPnPEbIPUFo7_Bh4m3gt3ozxa4cbrLwFiBFMetOp3nwnv7cxTg4pROc26xOMbGhKElJW3oslsQLjTzAxXeOyXDqmZEOkHR-u'),
('CPEN101', 'Linguistics: An Introduction', 'William McGregor', 2017, 'An introductory textbook on linguistics.', 'https://assets.cambridge.org/97805216/14788/cover/9780521614788.jpg'),
('CPEN202', 'Chemistry: The Central Science', 'Brown, LeMay, Bursten', 2018, 'A widely used textbook in chemistry .', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSEwK8T6KpgBhAYSY-29L6QaH3EPWSJqrQHwIhCRnZxiX-VYPUV'),
('CPEN201', 'Art History', 'Marilyn Stokstad', 2021, 'An authoritative textbook on the history of art.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpPoSmqU3TTXXT1oJfJD3Jh6Mvphu4UEHvBQ&usqp=CAU'),
('CPEN101', 'Psychology: Themes and Variations', 'Wayne Weiten', 2019, 'A comprehensive psychology textbook covering various themes.', 'https://books.google.com.gh/books/content?id=dEfuAAAAMAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE726OnqhNhAZ73p0nmaO_VEQYXT8GDcS0EewO-yp_BtZk3mpDAIrWNu6Wg8nDD-zqjJcN1yDCp3I0Eav5JP54a-mR7mlVMzOlAedYobPzDekOgRjmn40XainRjRDaJokjWTjU4wu'),
('CPEN202', 'Modern Art: Revised and Updated', 'Norbert Lynton', 2018, 'An updated edition of the classic text on modern art.', 'https://www.amazon.com/Modern-Art-Revised-Updated-3rd/dp/0131895656'),
('CPEN101', 'Biology: Concepts and Connections', 'Campbell et al.', 2017, 'A textbook emphasizing the connection between biology and everyday life.', 'https://m.media-amazon.com/images/I/51gTFW6LUfL._SX218_BO1,204,203,200_QL40_FMwebp_.jpg'),
('CPEN201', 'Microeconomics: Principles and Policy', 'William J. Baumol', 2016, 'A comprehensive guide to microeconomic principles and policy.', 'https://www.google.com.gh/books/edition/Macroeconomics_Principles_and_Policy/qQW0BAAAQBAJ?hl=en&gbpv=1&pg=PP1&printsec=frontcover');


-- [23/07, 13:55] Nicole: -- Club 1
INSERT INTO clubs (club_name, patron_id, club_description, logo, member_count)
VALUES ('Chess Club', 10909876, 'A club for chess enthusiasts to play and improve their skills.', 'https://www.ug.edu.gh/sites/default/files/ug_standard_new_sl_1.png', 15),
('Art Society', 10923456, 'A club for artists to collaborate and showcase their creative works.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiW_OcchpHy1tm9hnzlQDcGv3JG1a-r-jW9jsf7zMZuw&s', 20),
('Debate Club', 10956789, 'A club to engage in lively debates on various topics.', 'https://enactus.org/wp-content/uploads/2020/03/Enactus-Gray.png', 25),
('Environmental Club', 10909876, 'A club focused on promoting environmental awareness and sustainability.', 'https://tbcdn.talentbrew.com/company/33099/25474/content/arm-logo.svg', 30),
('Drama Society', 10923456, 'A club for theatre enthusiasts to practice and perform plays.', 'https://enactus.org/wp-content/uploads/2020/03/Enactus-Gray.png', 18),
('Music Ensemble', 10956789, 'A club for musicians to form bands and perform together.', 'https://www.ug.edu.gh/sites/default/files/ug_standard_new_sl_1.png', 12),
('Photography Club', 10909876, 'A club for photographers to capture and share captivating images.', 'https://enactus.org/wp-content/uploads/2020/03/Enactus-Gray.png', 22),
('Science Explorers', 10923456, 'A club to explore and conduct experiments in various scientific fields.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiW_OcchpHy1tm9hnzlQDcGv3JG1a-r-jW9jsf7zMZuw&s', 28),
('Language Exchange', 10956789, 'A club for language enthusiasts to practice and learn different languages.', 'https://www.ug.edu.gh/sites/default/files/ug_standard_new_sl_1.png', 16),
('Sports Club', 10909876, 'A club to engage in various sports activities and competitions.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiW_OcchpHy1tm9hnzlQDcGv3JG1a-r-jW9jsf7zMZuw&s', 35);


-- [23/07, 13:55] Nicole: -- Dues Payment 1
INSERT INTO dues (user_id, amount)
VALUES (10912345, 25.00),
(10923456, 15.00),
(10934567, 20.00),
(10945678, 18.50),
(10956789, 30.00),
(10967890, 12.00),
(10901234, 22.00),
(10909876, 28.00),
(10998765, 16.00),
(10987654, 35.00);


-- [23/07, 13:55] Nicole: -- Club Member 1
INSERT INTO club_members (user_id, club_id)
VALUES (10912345, 1),
(10923456, 1),
(10934567, 1),
(10945678, 2),
(10956789, 2),
(10967890, 2),
(10901234, 3),
(10909876, 3),
(10998765, 4),
(10987654, 4);