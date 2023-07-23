# SES - Project Overview ![ug_logo](https://github.com/Serkhani/ses/assets/66341820/d1381c0c-11f2-462a-8bce-609c81cf6f29)

# Description
The School of Engineering Communication App is a comprehensive software solution designed to facilitate effective communication and information dissemination within the School of Engineering at the University of Ghana. This multi-platform app is built using a combination of Flutter, React, Spring Boot, PostgreSQL, and hosted on Render and Neon.

# Key Features
### - Announcements and Notifications: 
        - Faculty members can post important announcements, and students receive real-time push notifications for updates.
### - Timetables: 
        - Students can access personalized class timetables, complete with course details, locations, and instructor names.
### - Events and Tasks: 
        - The app features a calendar displaying upcoming engineering-related events, and students can create and manage their tasks and set reminders.
### - Dashboard: 
        - Each user (student or faculty) has a personalized dashboard displaying relevant information, such as upcoming deadlines, recent announcements, and tasks.
### - Fault Reporting: 
        - Students can easily report campus facility faults for prompt resolution by the appropriate department.
### - Assignment Submission: 
        - Faculty members can create and assign engineering-related assignments, and students can conveniently submit their completed assignments.
### - Exam Past Questions and Textbook Portals: 
        - Students can access a repository of past exam questions and a textbook portal for recommended resources.
### - Clubs and Societies: 
        - The app provides information about engineering-related clubs and societies, allowing students to join and participate in club activities.

# Technologies Used
[Flutter](https://flutter.dev): The mobile version of the app is developed using [Flutter](https://flutter.dev), a powerful and cross-platform mobile app development framework.

[React](https://react.dev/): The web version of the app is built with React, a popular JavaScript library for creating interactive user interfaces.

[SpringBoot](https://spring.io): The back-end API microservice is developed using Spring Boot, a Java-based framework for building robust RESTful APIs.

[PostgreSQL](https://www.postgresql.org/): The app's data is stored and managed using PostgreSQL, an open-source relational database management system.

# Installation
Instructions for installing and running the app locally can be found in the project's README.md file.

# Architecture
The system follows a typical client-server architecture, with the front-end built using [Flutter](https://flutter.dev) for the mobile app and a back-end server for handling log-in, registration, and data storage. The front-end and back-end components will be connected through API using [SpringBoot](https://spring.io).

## Front-end Architecture
The front-end of the mobile system is developed using [Flutter](https://flutter.dev), a cross-platform framework for building mobile apps. The [Flutter](https://flutter.dev) architecture follows a widget-based approach, where the UI components are built using a hierarchy of widgets.

- **Flutter Mobile App:** 
  
|launcher|login|failed|
|:---:|:---:|:---:|
|![launcher](https://github.com/Serkhani/ses/assets/66341820/e9216a80-82cf-4c4b-bffd-6c6c1e673426)| ![login](https://github.com/Serkhani/ses/assets/66341820/9fa51c3c-296c-4532-91c4-1c383bffa670)| ![error](https://github.com/Serkhani/ses/assets/66341820/67a0c71d-3a36-499b-84a9-d68791a56071)|
|success_dashboard|profile|systems|
|![login_success](https://github.com/Serkhani/ses/assets/66341820/f09a79e3-bbaf-4ae1-aa98-c0cacb8c1a39)| ![profile](https://github.com/Serkhani/ses/assets/66341820/70ba36d2-ac3c-4470-a48c-0fc30ccac302)| ![systems](https://github.com/Serkhani/ses/assets/66341820/f9f1dd4a-08e8-4542-866c-76913579fa7b)|

- **React Web App:**
  
|loginpage|forgot_password|info_entry_page|about_school|
|:---:|:---:|:---:|:---:|
|![loginpage](https://github.com/FaroukDev-tech/React_Student_Mgt_System/assets/66341820/722b610b-fc2b-4ddb-85ae-8e66a07d69bb)| ![forgot password](https://github.com/FaroukDev-tech/React_Student_Mgt_System/assets/66341820/5293fcbf-cb1b-47e6-8c74-5ea2bf7abfb7)| ![info entry page](https://github.com/FaroukDev-tech/React_Student_Mgt_System/assets/66341820/9951d075-313d-4252-ae76-56168539d89e)| ![about_school](https://github.com/FaroukDev-tech/React_Student_Mgt_System/assets/66341820/e4268b0c-a250-4fc1-b4a9-1159b1011fd2)|
|dashboard|courses_to_be_taken|assignments|grades|
|![dashboard](https://github.com/FaroukDev-tech/React_Student_Mgt_System/assets/66341820/d77a6049-f2c2-43a4-94bb-45b3d2ce1448)| ![courses_to_be_taken](https://github.com/FaroukDev-tech/React_Student_Mgt_System/assets/66341820/aa0fb3e4-9873-4d24-9a36-50bf56897c6f)|![assignments](https://github.com/FaroukDev-tech/React_Student_Mgt_System/assets/66341820/fd94b79b-46fc-43ad-bed2-000f5d6ab578)|![Grades](https://github.com/FaroukDev-tech/React_Student_Mgt_System/assets/66341820/69ab0165-3176-4344-a5c8-6085565092a7)|



## Back-end Architecture
The back-end of the system will be responsible for handling log-in, user registration, and data storage. It will provide APIs that the mobile app communicates with to perform these tasks.
- **API Microservice:** The Spring Boot API microservice is hosted on [Render](https://render.com/), where it handles data exchange between the front-end and the PostgreSQL database.
- **PostgreSQL Database:** The app's PostgreSQL database is hosted on [Neon](https://neon.tech), ensuring high availability and data security.

<!-- The back-end architecture includes the following components:

Authentication: Implement an authentication mechanism, such as JSON Web Tokens (JWT), to secure the log-in process and protect user data.

API Endpoints: Define API endpoints for log-in, user registration, and other necessary functionalities. These endpoints handle requests from the mobile app and interact with the database.

Database: Choose a suitable database system for storing student information. Popular options include MySQL, PostgreSQL, or Firebase Realtime Database. Design the database schema to store user credentials and any additional required information. -->

# Installation and Setup
 Go to the respective folder paths to see how to set them up.
# Conclusion
The mobile system project aims to provide a user-friendly interface for student log-in, registration, and accessing a dashboard. By leveraging the power of Flutter for the mobile app, React for the web app, and Spring Boot for the API microservice, we have developed an efficient and user-friendly platform that caters to the diverse needs of students, faculty, and management. The app's centralized communication system, personalized dashboards, access to essential resources, and streamlined task management are key features that contribute to a cohesive and productive learning environment.

<!-- flutter vid: https://github.com/Serkhani/ses/assets/66341820/ee140c87-cb0f-48a0-aaf1-446aed700f1f -->