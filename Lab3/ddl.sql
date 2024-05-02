-- creating a university database
Create Database University_DBMSCS422;
use University_DBMSCS422;

-- Create a College Table
Create Table College (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    name varchar(100) NOT NULL UNIQUE, 
    phone varchar(20), 
    office varchar(255), 
    dean int
    );

/**
* - Department Table
* - Primary Key : code
-- Department cannot exist without the college
*/
Create Table Department (
    code int PRIMARY KEY NOT NULL, 
    name varchar(100) UNIQUE NOT NULL, 
    phone varchar(20), 
    office varchar(255), 
    collegeId int NOT NULL, 
    FOREIGN KEY (collegeId) REFERENCES college(id)
    );

-- Foreign Key college id is added to know which faculty belongs to which college.
-- email is added to maintain the faculty uniqueness in the college
Create Table Faculty (
    id int PRIMARY KEY NOT NULL, 
    name varchar(100) NOT NULL, 
    email varchar(100) UNIQUE NOT NULL,
    collegeId int NOT NULL,
    FOREIGN KEY (collegeId) REFERENCES College(id)
    );


Create Table DepartmentChairman (
    id int PRIMARY KEY NOT NULL, 
    departmentCode int NOT NULL, 
    facultyId int NOT NULL, 
    startDate DATETIME, 
    FOREIGN KEY (departmentCode) REFERENCES Department(code), 
    FOREIGN KEY (facultyId) REFERENCES Faculty(id)
    );


Alter Table College add constraint fk_dean_faculty FOREIGN KEY (dean) REFERENCES Faculty(id);

Create Table Course (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    title varchar(100) UNIQUE NOT NULL, 
    code varchar(50) UNIQUE NOT NULL, 
    level int, 
    credits int, 
    `desc` TEXT, 
    departmentCode int, 
    FOREIGN KEY (departmentCode) REFERENCES Department(code)
    );

-- Instructor and Faculty table can be same and can be differentiated with the ROLE
Create Table Instructor (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    name varchar(255), 
    office varchar(255), 
    phone varchar(20), 
    `rank` int,
    departmentCode int,
    FOREIGN KEY (departmentCode) REFERENCES Department(code)
    );

-- Section cannot exist without a Course
Create Table Section (
    secId int PRIMARY KEY NOT NULL, 
    secNo int, 
    semester int, 
    `room` VARCHAR(10) NULL COMMENT 'Building Name Followed by Room Number',
    year int, 
    instructorId int NULL, 
    courseId int NOT NULL,
    FOREIGN KEY (instructorId) REFERENCES Instructor(id),
    FOREIGN KEY (courseId) REFERENCES Course(id),
    CONSTRAINT uniqueSecNoSemYear UNIQUE (secNo, semester, year)
    );


Create Table Student (
    sid int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    firstName varchar(100), 
    middleName varchar(100), 
    lastName varchar(100), 
    phone varchar(255), 
    dob DATETIME NULL, 
    major varchar(255), 
    departmentCode int, 
    FOREIGN KEY (departmentCode) REFERENCES Department(code)
    );

-- A student can enroll in multiple section and they are graded after the course is completed
Create Table StudentSection (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    studentId int, 
    sectionId int, 
    grade char(2), 
    FOREIGN KEY (studentId) REFERENCES Student(sid), 
    FOREIGN KEY (sectionId) REFERENCES Section(secId)
    );
