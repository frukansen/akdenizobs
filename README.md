University Student Information System (SIS) Clone

This project is a simplified clone of the student information system used at Akdeniz University. It was created for educational purposes as part of a Database Systems course. The system is developed using Microsoft SQL Server and includes a database structure to manage and simulate the following data:

Student Information: Basic data on enrolled students.
Instructor Information: Details about academic staff and instructors.
Courses: Courses offered each semester, including course codes and titles.
Administrative Staff: Administrative staff information managing student records.
Enrollment: A relational table mapping students to courses.

###Database Setup

Import the provided SQL file into your SQL Server instance.
Ensure you have SQL Server Management Studio or a compatible tool.
Run SQL Commands

Use the SQL files provided in the scripts folder to create tables, relationships, and sample data.

###Anonymization Notice

Important: Ensure that all data conforms to data privacy standards before any public use.
All personal information is meant to be pseudonymized and should not contain real identifying data.

###Database Structure

Tables

Students: Contains details such as student ID, name, and program.
Instructors: Holds instructor ID, name, department, and contact information.
Courses: Details of course codes, names, and credits.
Enrollment: Links students to courses with additional grading details.

Relationships
Students and Courses: Many-to-many relationship through the Enrollment table.
Instructors and Courses: One-to-many relationship, where each instructor can teach multiple courses.
Contributing
This project is a foundational database model; contributions to enhance functionality, add features, or optimize queries are welcome. Please submit a pull request or open an issue to discuss changes.
