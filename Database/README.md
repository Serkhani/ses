# School of Engineering Communication App - PostgreSQL Project

## Description
This section of the project was build with PostgreSQL database. It is designed to support the communication and information dissemination requirements of the School of Engineering at the University of Ghana. The database schema is carefully crafted to efficiently store and manage data related to departments, roles, users, courses, lecturers, students, announcements, tasks, faults, assignments, past exam questions, textbooks, clubs, and dues.

## Proposed Schema
The proposed database schema includes the following tables:

**Departments**: Stores department-related information, including the department name, head of department, and department timetable.

**Roles**: Contains role-related information, such as role names, defining the roles available in the application (student, lecturer, management).

**Users**: Represents user accounts in the app, with details like the user ID, PIN, and a foreign key referencing the role ID.

**Courses**: Holds data related to academic courses, including course ID, course name, department ID, credit hours, description, and semester.

**Lecturers**: Stores details about lecturers, such as lecturer ID, course ID, department ID, full name, email, contact number, gender, and profile picture.

**Students**: Contains information about students, including user ID, department ID, full name, email, enrollment date, programme, graduation year, current year, address, contact number, gender, guardian name, guardian contact number, and profile picture.

**Announcements**: Keeps track of announcements made by users, storing details like announcement ID, title, content, date created, image, and user ID.

**Tasks**: Stores task-related data, including task ID, user ID, task title, task description, deadline, and completion status.

**Faults**: Contains information about reported campus facility faults, including fault ID, fault type, description, location, reported by user ID, date reported, and status.

**Assignments**: Stores data related to assignments, such as assignment ID, lecturer ID, course ID, topic, assignment description, image, deadline, and status.

**PastExamQuestions**: Holds past exam question details, including paper ID, course ID, lecturer ID, examination year, and PDF file location.

**Textbooks**: Stores textbook information, such as textbook ID, course ID, title, author, publication year, description, and thumbnail.

**Clubs**: Contains details about engineering-related clubs, including club ID, club name, patron ID, club description, logo, and member count.

**ClubMembers**: Represents the membership of users in clubs, containing member ID, user ID, and club ID.

**Dues**: Tracks dues to be paid by users, storing dues ID, user ID, and amount.

## Installation and Usage
The proposed schema can be implemented in a PostgreSQL database by executing the provided SQL statements. The schema defines the tables and their relationships, enabling the app to store and retrieve data efficiently.

To set up the database, follow these steps:

>Create a new PostgreSQL database.

>Execute the SQL statements in the provided script to create the required tables and constraints.

>Populate the tables with initial data as needed.
