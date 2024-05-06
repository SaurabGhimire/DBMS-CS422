Drop Database DBMS_CS422_Project1;
Create Database DBMS_CS422_Project1;
use DBMS_CS422_Project1;

Create TABLE Course (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    code varchar(20) NOT NULL UNIQUE COMMENT "Course code letters followed by some numbers",
    title varchar(255) NOT NULL UNIQUE,
    level ENUM("l200", "l300", "l400", "l500", "l600") default "l400",
    credit int DEFAULT 0,
    isDeleted boolean default false
);

Create TABLE CoursePrerequisites (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    courseId int NOT NULL,
    prerequisiteId int NOT NULL,
    FOREIGN KEY (courseId) REFERENCES Course(id) ON DELETE CASCADE,
    FOREIGN KEY (prerequisiteId) REFERENCES Course(id) ON DELETE CASCADE,
    CONSTRAINT unique_course_preq UNIQUE (courseId, prerequisiteId)
);

Create Table Instructor (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    firstName varchar(100), 
    middleName varchar(100), 
    lastName varchar(100), 
    email varchar(100),
    phone varchar(20),
    isDeleted boolean default false
    );

Create TABLE CourseSection (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    courseId int NOT NULL,
    instructorId int NULL,
    location varchar(100) COMMENT "Building name followed by Room Number",
    startDate DATE,
    endDate DATE,
    sectionNumber char(2),
    timeSlot varchar(50) COMMENT "Example: Monday to Friday 09:00 AM - 03:00 PM",
    FOREIGN KEY (courseId) REFERENCES Course(id) ON DELETE CASCADE,
    FOREIGN KEY (instructorId) REFERENCES Instructor(id) ON DELETE SET NULL,
    CONSTRAINT courseSectionUnique UNIQUE (courseId, startDate, sectionNumber),
    isDeleted boolean default false
);

Create Table SectionAssignment (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title varchar(255) NOT NULL,
    instructions TEXT,
    totalScore int NOT NULL,
    addedDate DATETIME,
    dueDate DATETIME,
    isDeleted boolean default false,
    courseSectionId int NOT NULL,
    FOREIGN KEY (courseSectionId) REFERENCES CourseSection(id) ON DELETE CASCADE
);

Create Table SectionAssignmentAttatchment (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    sectionAssignmentId int NOT NULL,
    fileName varchar(100) NOT NULL,
    filePath varchar(255) NOT NULL,
    FOREIGN KEY (sectionAssignmentId) REFERENCES SectionAssignment(id) ON DELETE CASCADE
);

Create Table Student (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    firstName varchar(100), 
    middleName varchar(100), 
    lastName varchar(100), 
    email varchar(100),
    phone varchar(20), 
    dob DATE NULL,
    isDeleted Boolean default false
);

Create TABLE SectionStudentsEnrolled (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    sectionId int NOT NULL,
    studentId int NOT NULL,
    score int NULL,
    FOREIGN KEY (sectionId) REFERENCES CourseSection(id) ON DELETE CASCADE,
    FOREIGN KEY (studentId) REFERENCES Student(id),
    grade char(2),
    CONSTRAINT section_student_unique UNIQUE (sectionId,studentId)
);

Create TABLE SectionAssignmentSubmissions (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    assignmentId int NOT NULL,
    studentId int NOT NULL,
    score int NULL,
    status int default 1 COMMENT "1 -> Not Started 2 -> Submitted 3 -> Returned 4-> Revision Requested",
    addedDate DATETIME,
    modifiedDate DATETIME,
    FOREIGN KEY (assignmentId) REFERENCES SectionAssignment(id) ON DELETE CASCADE,
    FOREIGN KEY (studentId) REFERENCES Student(id) ON DELETE CASCADE,
    CONSTRAINT assignment_student_unique UNIQUE (assignmentId,studentId) COMMENT "Student can submit assignment only once, later the same record will be updated"
);