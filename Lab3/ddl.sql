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
*/
Create Table Department (
    code int PRIMARY KEY NOT NULL, 
    name varchar(100) UNIQUE NOT NULL, 
    phone varchar(20), 
    office varchar(255), 
    collegeId int NOT NULL, 
    FOREIGN KEY (collegeId) REFERENCES college(id)
    );


Create Table Faculty (
    id int PRIMARY KEY NOT NULL, 
    name varchar(100) NOT NULL, 
    email varchar(100) UNIQUE NOT NULL
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
    departmentId int, 
    FOREIGN KEY (departmentId) REFERENCES Department(code)
    );


Create Table Instructor (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    name varchar(255), 
    office varchar(255), 
    phone varchar(20), 
    `rank` int
    );

Create Table Section (
    secId int PRIMARY KEY NOT NULL, 
    secNo int, 
    semester int, 
    `room` VARCHAR(10) NULL COMMENT 'Building Name Followed by Room Number'
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
    departmentId int, 
    FOREIGN KEY (departmentId) REFERENCES Department(code)
    );

Create Table StudentSection (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    studentId int, 
    sectionId int, 
    grade char(2), 
    FOREIGN KEY (studentId) REFERENCES Student(sid), 
    FOREIGN KEY (sectionId) REFERENCES Section(secId)
    );



