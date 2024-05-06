Insert into Course (code, title, level, credit) VALUES
    ("CS390", "FPP", "l300", 4),
    ("CS401", "MPP", "l400", 4),
    ("CS472", "Web Application Programming", "l400", 4),
    ("CS544", "Enterprise Architecture", "l500", 4),
    ("CS572", "Modern Web Application", "l500", 4),
    ("CS590", "Software Architecture", "l500", 4),
    ("CS422", "Database Management System", "l400", 4),
    ("CS435", "Algorithms", "l400", 4),
    ("CS525", "Advanced Software Development", "l500", 4),
    ("CS522", "Big Data", "l500", 4),
    ("CS582", "Machine Learning", "l500", 4),
    ("CS425", "Software Engineering", "l400", 4);

Insert into CoursePrerequisites (courseId, prerequisiteId) VALUES
    (4, 2),
    (9, 3),
    (9, 2),
    (6, 2);

INSERT INTO Instructor (firstName, middleName, lastName, email, phone) VALUES 
    ('John', 'Doe', 'Smith', 'john@example.com', '123-456-7890'),
    ('Jane', 'Mary', 'Doe', 'jane@example.com', '987-654-3210'),
    ('Michael', 'James', 'Johnson', 'michael@example.com', '555-555-5555'),
    ('Emily', 'Ann', 'Davis', 'emily@example.com', '777-777-7777'),
    ('David', 'Robert', 'Wilson', 'david@example.com', '999-999-9999'),
    ('Sarah', 'Elizabeth', 'Brown', 'sarah@example.com', '111-222-3333'),
    ('Christopher', 'Thomas', 'Miller', 'chris@example.com', '444-444-4444'),
    ('Amanda', 'Nicole', 'Taylor', 'amanda@example.com', '666-666-6666'),
    ('Matthew', 'Ryan', 'Anderson', 'matthew@example.com', '888-888-8888'),
    ('Jennifer', 'Michelle', 'White', 'jennifer@example.com', '333-333-3333');


INSERT INTO CourseSection (courseId, instructorId, location, startDate, endDate, sectionNumber, timeSlot) VALUES 
    (1, 1, 'V101', '2024-09-01', '2024-12-15', '01', 'Monday to Friday 09:00 AM - 11:00 AM'),
    (1, 4, 'V103', '2024-09-01', '2024-12-15', '02', 'Monday to Friday 09:00 AM - 11:00 AM'),
    (2, 2, 'V201', '2024-09-01', '2024-12-15', '01', 'Monday to Friday 11:00 AM - 01:00 PM'),
    (2, 8, 'V208', '2024-09-01', '2024-12-15', '02', 'Monday to Friday 11:00 AM - 01:00 PM'),
    (2, 4, 'V211', '2024-09-01', '2024-12-15', '03', 'Monday to Friday 11:00 AM - 01:00 PM'),
    (3, 5, 'V301', '2024-09-01', '2024-12-15', '01', 'Monday to Friday 01:00 PM - 03:00 PM'),
    (4, 1, 'V212', '2024-10-01', '2024-12-15', '01', 'Monday to Friday 09:00 AM - 11:00 AM'),
    (5, 9, 'V211', '2024-10-01', '2024-12-15', '01', 'Monday to Friday 11:00 AM - 01:00 PM'),
    (6, 6, 'V311', '2024-10-01', '2024-12-15', '01', 'Monday to Friday 01:00 PM - 03:00 PM'),
    (6, 10, 'V317', '2024-10-01', '2024-12-15', '02', 'Monday to Friday 01:00 PM - 03:00 PM'),
    (7, 7, 'V306', '2024-11-01', '2024-12-15', '01', 'Monday to Friday 09:00 AM - 11:00 AM'),
    (7, 2, 'V309', '2024-11-01', '2024-12-15', '02', 'Monday to Friday 09:00 AM - 11:00 AM'),
    (8, 8, 'V209', '2024-11-01', '2024-12-15', '01', 'Monday to Friday 11:00 AM - 01:00 PM'),
    (9, 9, 'V208', '2024-12-01', '2024-12-15', '01', 'Monday to Friday 01:00 PM - 03:00 PM'),
    (9, 2, 'V209', '2024-12-01', '2024-12-15', '02', 'Monday to Friday 01:00 PM - 03:00 PM'),
    (9, 5, 'V209', '2024-12-01', '2024-12-15', '03', 'Monday to Friday 01:00 PM - 03:00 PM'),
    (10, 3, 'V217', '2024-12-01', '2024-12-15', '03', 'Monday to Friday 01:00 PM - 03:00 PM'),
    (10, 10, 'V208', '2024-12-01', '2024-12-15', '01', 'Monday to Friday 09:00 AM - 11:00 AM');


INSERT INTO SectionAssignment (title, instructions, totalScore, addedDate, dueDate, courseSectionId) VALUES 
    ('Lab 1', 'Complete exercises 1-5 in the lab manual.', 10, '2024-09-01 09:00:00', '2024-09-15 23:59:59', 1),
    ('Lab 2', 'Design and implement a simple database schema.', 10, '2024-09-15 09:00:00', '2024-09-30 23:59:59', 2),
    ('Assignment 1', 'Write a report on the given topic.', 15, '2024-09-30 09:00:00', '2024-10-15 23:59:59', 3),
    ('Assignment 2', 'Develop a small web application.', 20, '2024-10-15 09:00:00', '2024-10-30 23:59:59', 4),
    ('Lab 3', 'Implement algorithms for sorting and searching.', 10, '2024-10-30 09:00:00', '2024-11-15 23:59:59', 5),
    ('Lab 4', 'Write and test code for data manipulation.', 10, '2024-11-15 09:00:00', '2024-11-30 23:59:59', 6),
    ('Assignment 3', 'Design and present a software architecture.', 20, '2024-11-30 09:00:00', '2024-12-15 23:59:59', 7),
    ('Project 1', 'Develop a prototype for the project proposal.', 50, '2024-12-15 09:00:00', '2024-12-30 23:59:59', 8),
    ('Lab 5', 'Implement advanced features in the project.', 10, '2024-12-30 09:00:00', '2025-01-15 23:59:59', 9),
    ('Final Project', 'Complete and present the final project.', 50, '2025-01-15 09:00:00', '2025-01-30 23:59:59', 10),
    ('Lab 6', 'Perform additional exercises.', 10, '2025-02-01 09:00:00', '2025-02-15 23:59:59', 1),
    ('Assignment 4', 'Write a research paper.', 20, '2025-02-15 09:00:00', '2025-02-28 23:59:59', 2),
    ('Lab 7', 'Implement new features.', 10, '2025-03-01 09:00:00', '2025-03-15 23:59:59', 3),
    ('Assignment 5', 'Create a presentation.', 15, '2025-03-15 09:00:00', '2025-03-30 23:59:59', 4),
    ('Lab 8', 'Optimize code performance.', 10, '2025-03-30 09:00:00', '2025-04-15 23:59:59', 5),
    ('Assignment 6', 'Design user interfaces.', 20, '2025-04-15 09:00:00', '2025-04-30 23:59:59', 6),
    ('Lab 9', 'Test software functionalities.', 10, '2025-04-30 09:00:00', '2025-05-15 23:59:59', 7),
    ('Assignment 7', 'Implement security measures.', 20, '2025-05-15 09:00:00', '2025-05-30 23:59:59', 8),
    ('Lab 10', 'Conduct experiments.', 10, '2025-05-30 09:00:00', '2025-06-15 23:59:59', 9),
    ('Assignment 8', 'Write test cases.', 15, '2025-06-15 09:00:00', '2025-06-30 23:59:59', 10),
    ('Lab 11', 'Debug and troubleshoot.', 10, '2025-07-01 09:00:00', '2025-07-15 23:59:59', 1),
    ('Assignment 9', 'Create documentation.', 20, '2025-07-15 09:00:00', '2025-07-30 23:59:59', 2),
    ('Lab 12', 'Deploy software.', 10, '2025-07-30 09:00:00', '2025-08-15 23:59:59', 3),
    ('Assignment 10', 'Prepare for final presentation.', 250, '2025-08-15 09:00:00', '2025-08-30 23:59:59', 4),
    ('Lab 13', 'Perform system integration.', 10, '2025-08-30 09:00:00', '2025-09-15 23:59:59', 5),
    ('Assignment 11', 'Evaluate project outcomes.', 20, '2025-09-15 09:00:00', '2025-09-30 23:59:59', 6),
    ('Lab 14', 'Conduct final testing.', 10, '2025-09-30 09:00:00', '2025-10-15 23:59:59', 7),
    ('Assignment 12', 'Write project summary.', 20, '2025-10-15 09:00:00', '2025-10-30 23:59:59', 8),
    ('Lab 15', 'Prepare for project presentation.', 10, '2025-10-30 09:00:00', '2025-11-15 23:59:59', 9),
    ('Final Project Presentation', 'Present final project.', 50, '2025-11-15 09:00:00', '2025-11-30 23:59:59', 10);


INSERT INTO Student (firstName, middleName, lastName, email, phone, dob) VALUES 
    ('Suresh', 'Kumar', 'Shrestha', 'suresh@example.com', '123-456-7890', '2000-01-01'),
    ('Sunita', 'Kumari', 'Maharjan', 'sunita@example.com', '987-654-3210', '2000-02-02'),
    ('Ramesh', 'Bikram', 'Gurung', 'ramesh@example.com', '555-555-5555', '2000-03-03'),
    ('Gita', 'Devi', 'Thapa', 'gita@example.com', '777-777-7777', '2000-04-04'),
    ('Hari', 'Bahadur', 'Bista', 'hari@example.com', '999-999-9999', '2000-05-05'),
    ('Sita', 'Kumari', 'Basnet', 'sita@example.com', '111-222-3333', '2000-06-06'),
    ('Prem', 'Kumari', 'Rai', 'prem@example.com', '444-444-4444', '2000-07-07'),
    ('Laxmi', 'Maya', 'Magar', 'laxmi@example.com', '666-666-6666', '2000-08-08'),
    ('Ram', 'Bahadur', 'Tamang', 'ram@example.com', '888-888-8888', '2000-09-09'),
    ('Ganga', 'Kumari', 'Lama', 'ganga@example.com', '333-333-3333', '2000-10-10'),
    ('Anita', 'Maya', 'Karki', 'anita@example.com', '222-222-2222', '2000-11-11'),
    ('Dilip', 'Kumar', 'Bhandari', 'dilip@example.com', '555-555-5555', '2000-12-12'),
    ('Nisha', 'Kumari', 'Sharma', 'nisha@example.com', '777-777-7777', '2001-01-01'),
    ('Rajesh', 'Bikram', 'Acharya', 'rajesh@example.com', '999-999-9999', '2001-02-02'),
    ('Sangita', 'Kumari', 'Adhikari', 'sangita@example.com', '111-222-3333', '2001-03-03'),
    ('Bikash', 'Raj', 'Poudel', 'bikash@example.com', '444-444-4444', '2001-04-04'),
    ('Rina', 'Kumari', 'Luitel', 'rina@example.com', '666-666-6666', '2001-05-05'),
    ('Prakash', 'Bahadur', 'Thapa', 'prakash@example.com', '888-888-8888', '2001-06-06'),
    ('Saraswati', 'Kumari', 'Koirala', 'saraswati@example.com', '333-333-3333', '2001-07-07');

INSERT INTO Student (firstName, middleName, lastName, email, phone, dob) VALUES 
    ('Alok', 'Raj', 'Shrestha', 'alok@example.com', '111-111-1111', '2001-08-08'),
    ('Komal', 'Kumari', 'Shahi', 'komal@example.com', '222-222-2222', '2001-09-09'),
    ('Rajiv', 'Kumar', 'Raut', 'rajiv@example.com', '333-333-3333', '2001-10-10'),
    ('Sarita', 'Devi', 'Shrestha', 'sarita@example.com', '444-444-4444', '2001-11-11'),
    ('Dinesh', 'Bikram', 'Pokhrel', 'dinesh@example.com', '555-555-5555', '2001-12-12'),
    ('Pratima', 'Kumari', 'Ghimire', 'pratima@example.com', '666-666-6666', '2002-01-01'),
    ('Anil', 'Kumar', 'Dhakal', 'anil@example.com', '777-777-7777', '2002-02-02'),
    ('Rita', 'Maya', 'Gurung', 'rita@example.com', '888-888-8888', '2002-03-03'),
    ('Shyam', 'Bahadur', 'Gautam', 'shyam@example.com', '999-999-9999', '2002-04-04'),
    ('Uma', 'Devi', 'Pandey', 'uma@example.com', '123-123-1234', '2002-05-05');

-- Generate random scores for each enrolled student within the range of 60 to 100
INSERT INTO SectionStudentsEnrolled (sectionId, studentId, score)
    SELECT 
        cs.id AS sectionId,
        s.id AS studentId,
        ROUND(RAND() * 41) + 60 AS score -- Score range from 60 to 100
        FROM CourseSection cs
        CROSS JOIN Student s
        LEFT JOIN SectionStudentsEnrolled sse ON cs.id = sse.sectionId AND s.id = sse.studentId
        WHERE sse.id IS NULL
        ORDER BY cs.id, s.id
        LIMIT 400;

-- Adjust the grade on the basis of scores
UPDATE SectionStudentsEnrolled
SET grade = CASE 
                WHEN score >= 93 THEN 'A'
                WHEN score BETWEEN 90 AND 92 THEN 'A-'
                WHEN score >= 87 AND score <= 89 THEN 'B+'
                WHEN score BETWEEN 83 AND 86 THEN 'B'
                WHEN score BETWEEN 80 AND 82 THEN 'B-'
                WHEN score BETWEEN 77 AND 79 THEN 'C+'
                WHEN score BETWEEN 73 AND 76 THEN 'C'
                WHEN score BETWEEN 70 AND 72 THEN 'C-'
                ELSE 'NC'
            END;


-- Insert random assignment submissions 120 records
INSERT INTO SectionAssignmentSubmissions (assignmentId, studentId, score, addedDate, modifiedDate)
SELECT 
    sa.id AS assignmentId, 
    ts.id AS studentId, 
    FLOOR(RAND() * (20 - 7 + 1)) + 7 AS score, 
    NOW() AS addedDate, 
    NOW() AS modifiedDate
FROM 
    SectionAssignment sa
    CROSS JOIN (SELECT id FROM Student ORDER BY RAND() LIMIT 80) ts LIMIT 120;

