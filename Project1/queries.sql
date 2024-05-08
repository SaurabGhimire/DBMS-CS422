-- # Queries:
-- 1) Retrieve the list of all students who have enrolled in a specific course.
-- Course title "FPP"
SELECT DISTINCT
    s.id as studentId, 
    c.id as courseId, 
    CONCAT(s.firstName, ' ', COALESCE(s.middleName, ''), ' ', s.lastName) as name, 
    c.title as courseTitle 
    FROM SectionStudentsEnrolled sse
    JOIN CourseSection cs ON sse.sectionId = cs.id
    JOIN Course c ON cs.courseId = c.id
    JOIN Student s ON sse.studentId = s.id
    WHERE c.title = "MPP";


-- 2) Retrieve the average grade of a specific assignment across all students.
-- id 2 - expected output 13.8966
-- id 3 - expected output 12.2759
SELECT AVG(sas.score) 
    FROM SectionAssignmentSubmissions sas
    LEFT JOIN SectionAssignment sa ON sa.id = sas.assignmentId
    WHERE sa.id = 2;



-- 3) Retrieve the list of all courses taken by a specific student.
SELECT DISTINCT CONCAT(s.firstName, ' ', COALESCE(s.middleName, ''), ' ', s.lastName) as studentName, c.title as courseTitle, s.id as studentId, c.id as courseId, CONCAT(YEAR(cs.startDate), ' ', DATE_FORMAT(cs.startDate, '%b')) AS monthYear 
    FROM  SectionStudentsEnrolled sse
    JOIN CourseSection cs ON sse.sectionId = cs.id
    JOIN Course c ON cs.courseId = c.id
    JOIN Student s ON sse.studentId = s.id
    WHERE s.id = 3 AND cs.isDeleted is false AND c.isDeleted is false;


-- 4) Retrieve the list of all instructors who teach a specific course.
SELECT DISTINCT CONCAT(i.firstName, ' ', COALESCE(i.middleName, ''), ' ', i.lastName) as "Instructor Name", c.title as courseTitle, c.id as courseId, i.id as instructorId
    FROM CourseSection cs
    JOIN Instructor i ON i.id = cs.instructorId
    JOIN Course c ON cs.courseId = c.id
    WHERE c.isDeleted is false
    AND cs.isDeleted is false
    AND c.title like "%MPP%";



-- 5) Retrieve the total number of students enrolled in a specific course.
SELECT
    count(*) as "Total Student",
    c.title as courseTitle
    FROM SectionStudentsEnrolled sse
    JOIN CourseSection cs ON sse.sectionId = cs.id
    JOIN Course c ON cs.courseId = c.id
    JOIN Student s ON sse.studentId = s.id
    WHERE c.title = "MPP";


-- 6) Retrieve the list of all assignments for a specific course.
SELECT sa.id as assignmentId, sa.title  as  assignmentTitle, c.title as courseTitle
    FROM CourseSection cs
    JOIN SectionAssignment sa ON sa.sectionId = cs.id
    JOIN Course c ON cs.courseId = c.id
    WHERE c.title = "Enterprise Architecture"
    ORDER BY assignmentTitle ASC;




-- 7) Retrieve the highest grade received by a specific student in a specific course.
-- assignment score retrieved
SELECT MAX(score) AS highest_grade
    FROM SectionAssignmentSubmissions sas
    JOIN SectionAssignment sa ON sas.assignmentId = sa.id
    JOIN CourseSection cs ON sa.sectionId = cs.id
    JOIN Course c ON c.id = cs.courseId
    JOIN Student s ON sas.studentId = s.id
    WHERE s.id = 15
    AND c.title = "MPP";


-- 8) Retrieve the list of all students who have not completed a specific assignment.
-- TODO
SELECT DISTINCT s.id, CONCAT(s.firstName, ' ', COALESCE(s.middleName, ''), ' ', s.lastName) as studentName, sa.title AS assignmentTitle, sa.id as assignmentId, cs.id as sectionId
    FROM Student s
    INNER JOIN SectionStudentsEnrolled sse ON s.id = sse.studentId
    INNER JOIN CourseSection cs ON sse.sectionId = cs.id
    JOIN SectionAssignment sa ON cs.id = sa.sectionId
    WHERE NOT EXISTS (
    SELECT 1
    FROM SectionAssignmentSubmissions sas
    WHERE s.id = sas.studentId AND sa.id = sas.assignmentId
    ) AND sa.id = 12 ORDER BY s.id;



-- 9) Retrieve the list of all courses that have more than 50 students enrolled.
SELECT DISTINCT c.id as courseId, c.title as courseTitle
    FROM Course c
    JOIN CourseSection cs ON c.id = cs.courseId
    JOIN SectionStudentsEnrolled sse ON cs.id = sse.sectionId
    GROUP BY c.id
    HAVING COUNT(sse.studentId) > 50;


-- 10) Retrieve the list of all students who have an overall grade average of 90% or higher.
SELECT s.id, s.firstName, s.middleName, s.lastName, AVG(sse.score) as averageScore
    FROM Student s
    JOIN SectionStudentsEnrolled sse ON s.id = sse.studentId
    JOIN CourseSection cs ON sse.sectionId = cs.id
    GROUP BY s.id
    HAVING AVG(sse.score) >= 90 ORDER BY averageScore desc;


-- 11) Retrieve the overall average grade for each course.
SELECT c.id as courseId, c.title as courseTitle, AVG(sse.score) as averageScore
    FROM Course c
    JOIN CourseSection cs ON cs.courseId = c.id
    JOIN SectionStudentsEnrolled sse ON cs.id = sse.sectionId
    GROUP BY c.id ORDER BY averageScore desc;


-- 12) Retrieve the average grade for each assignment in a specific course.
SELECT sa.id as assignmentId, sa.title as assignmentTitle, AVG(sas.score) as averageScore, c.id as courseId, cs.sectionNumber ,c.title as courseTitle
    FROM Course c
    JOIN CourseSection cs ON cs.courseId = c.id
    JOIN SectionAssignment sa ON sa.sectionId = cs.id
    JOIN SectionAssignmentSubmissions sas ON sas.assignmentId = sa.id
    WHERE c.title = "MPP"
    GROUP BY sa.id ORDER BY courseId asc;


-- 13) Retrieve the number of students who have completed each assignment in a specific course.
-- TODO
    SELECT COUNT(DISTINCT sse.studentId) AS totalStudentsCompletedAllAssignments
    FROM CourseSection cs
    JOIN SectionStudentsEnrolled sse ON cs.id = sse.sectionId
    WHERE 
    cs.id = 1
    AND sse.studentId IN (
        SELECT sas.studentId
        FROM SectionAssignment sa
        JOIN SectionAssignmentSubmissions sas ON sa.id = sas.assignmentId AND sas.studentId = sse.studentId
        WHERE sa.sectionId = 1
        GROUP BY sas.studentId ORDER BY sas.studentId
        HAVING COUNT(*) = (SELECT COUNT(*) FROM SectionAssignment WHERE sectionId = 1)
    );

-- 14) Retrieve the top 5 students with the highest overall grade average.
SELECT s.id AS studentId,
    CONCAT(s.firstName, ' ', COALESCE(s.middleName, ''), ' ', s.lastName) AS studentName,
    AVG(sas.score) AS averageGrade
    FROM Student s
    JOIN SectionAssignmentSubmissions sas ON s.id = sas.studentId
    GROUP BY s.id, s.firstName, s.middleName, s.lastName
    ORDER BY averageGrade DESC
    LIMIT 5;


-- 15) Retrieve the instructor with the highest overall average grade for all courses they teach.
SELECT i.id AS instructorId, CONCAT(i.firstName, ' ', COALESCE(i.middleName, ''), ' ', i.lastName) AS instructorName, AVG(sas.score) AS averageGrade
    FROM Instructor i
    JOIN CourseSection cs ON cs.instructorId = i.id
    JOIN Course c ON c.id = cs.courseId
    JOIN SectionAssignment sa ON cs.id = sa.sectionId
    LEFT JOIN SectionAssignmentSubmissions sas ON sa.id = sas.assignmentId
    GROUP BY i.id, i.firstName, i.middleName, i.lastName
    ORDER BY averageGrade DESC
    LIMIT 1;


-- 16) Retrieve the list of students who have a grade of A in a specific course.
SELECT s.id AS studentId, CONCAT(s.firstName, ' ', COALESCE(s.middleName, ''), ' ', s.lastName) AS studentName, c.title as courseTitle, cs.sectionNumber
    FROM Student s
    JOIN SectionStudentsEnrolled sse ON s.id = sse.studentId
    JOIN CourseSection cs ON sse.sectionId = cs.id
    JOIN Course c ON c.id = cs.courseId
    WHERE c.id = 1
    AND sse.grade = 'A';


-- 17) Retrieve the list of courses that have no assignments.
SELECT DISTINCT c.id AS courseId, c.title AS courseTitle
    FROM Course c
    LEFT JOIN CourseSection cs ON c.id = cs.courseId
    LEFT JOIN SectionAssignment sa ON cs.id = sa.sectionId
    WHERE sa.id IS NULL;


-- 18) Retrieve the list of students who have the highest grade in a specific course.
SELECT 
    s.id AS studentId,
    CONCAT(s.firstName, ' ', COALESCE(s.middleName, ''), ' ', s.lastName) AS studentName,
    MAX(sse.score) AS highestGrade
    FROM Student s
    JOIN SectionStudentsEnrolled sse ON s.id = sse.studentId
    JOIN CourseSection cs ON sse.sectionId = cs.id
    WHERE cs.courseId = 7
    GROUP BY s.id
    HAVING 
        MAX(sse.score) = (
            SELECT MAX(sas2.score) 
            FROM SectionStudentsEnrolled sas2
            JOIN CourseSection cs2 ON sas2.sectionId = cs2.id
            WHERE cs2.courseId = 7
        );


-- 19) Retrieve the list of assignments that have the lowest average grade in a specific course.
SELECT sa.id AS assignmentId,sa.title AS assignmentTitle,AVG(sas.score) AS averageGrade
FROM SectionAssignment sa
JOIN SectionAssignmentSubmissions sas ON sa.id = sas.assignmentId
JOIN CourseSection cs ON sa.sectionId = cs.id
WHERE cs.courseId = 1
GROUP BY sa.id
HAVING averageGrade <= (
        SELECT MIN(avg_score) + 0.0001
        FROM 
            (
                SELECT AVG(sas2.score) AS avg_score
                FROM SectionAssignment sa2
                JOIN SectionAssignmentSubmissions sas2 ON sa2.id = sas2.assignmentId
                JOIN CourseSection cs2 ON sa2.sectionId = cs2.id
                WHERE cs2.courseId = 1
                GROUP BY sa2.id
            ) AS min_avg_scores
    );



-- 20) Retrieve the list of students who have not enrolled in any course.
SELECT id AS studentId,CONCAT(firstName, ' ', COALESCE(middleName, ''), ' ', lastName) AS studentName
    FROM Student
    WHERE id NOT IN (
            SELECT DISTINCT studentId
            FROM SectionStudentsEnrolled
        );


-- 21) Retrieve the list of instructors who are teaching more than one course.
SELECT  i.id AS instructorId, CONCAT(i.firstName, ' ', COALESCE(i.middleName, ''), ' ', i.lastName) AS instructorName, COUNT(cs.id) AS courseCount
    FROM Instructor i
    JOIN CourseSection cs ON i.id = cs.instructorId
    GROUP BY i.id
    HAVING COUNT(cs.id) > 1;


-- 22) Retrieve the list of students who have not submitted an assignment for a specific course.
SELECT DISTINCT s.id AS studentId,CONCAT(s.firstName, ' ', COALESCE(s.middleName, ''), ' ', s.lastName) AS studentName
    FROM CourseSection cs 
    JOIN SectionStudentsEnrolled sse ON cs.id = sse.sectionId
    JOIN Student s ON s.id = sse.studentId
    LEFT JOIN SectionAssignment sa ON cs.id = sa.sectionId
    LEFT JOIN SectionAssignmentSubmissions sas ON s.id = sas.studentId AND sa.id = sas.assignmentId
    WHERE cs.courseId = 1 AND sas.studentId IS NULL;



-- 23) Retrieve the list of courses that have the highest average grade.
SELECT  cs.courseId AS courseId, c.title AS courseTitle, AVG(sse.score) AS averageGrade
    FROM CourseSection cs
    JOIN SectionStudentsEnrolled sse ON sse.sectionId = cs.id
    JOIN Course c ON cs.courseId = c.id
    GROUP BY cs.courseId, c.title
    HAVING 
        AVG(sse.score) >= (
            SELECT AVG(score) AS highestAverageGrade
            FROM 
                (
                    SELECT AVG(sas2.score) AS score
                    FROM SectionStudentsEnrolled sas2
                    JOIN CourseSection cs2 ON sas2.sectionId = cs2.id
                    GROUP BY cs2.courseId
                ) AS avg_scores
        ) ORDER BY averageGrade DESC;



-- 24) Retrieve the list of assignments that have a grade average higher than the overall grade average.
SELECT  sa.id AS assignmentId, sa.title AS assignmentTitle, AVG(sas.score) AS assignmentAverageGrade
    FROM SectionAssignment sa
    JOIN SectionAssignmentSubmissions sas ON sa.id = sas.assignmentId
    GROUP BY sa.id, sa.title
    HAVING 
        AVG(sas.score) > (
            SELECT 
                AVG(score) AS overallAverageGrade
            FROM 
                SectionAssignmentSubmissions
        );



-- 25) Retrieve the list of courses that have at least one student with a grade of F.
SELECT cs.courseId AS courseId,c.title AS courseTitle
    FROM CourseSection cs
    JOIN SectionStudentsEnrolled sse ON cs.id = sse.sectionId
    JOIN Course c ON cs.courseId = c.id
    WHERE sse.grade = 'F'
    GROUP BY cs.courseId, c.title;


-- 26) Retrieve the list of students who have the same grade in all their courses.
SELECT s.id AS studentId,CONCAT(s.firstName, ' ', COALESCE(s.middleName, ''), ' ', s.lastName) AS studentName
    FROM Student s
    JOIN SectionStudentsEnrolled sse ON s.id = sse.studentId
    JOIN CourseSection cs ON sse.sectionId = cs.id
    GROUP BY s.id
    HAVING COUNT(DISTINCT sse.score) = 1;



-- 27) Retrieve the list of courses that have the same number of enrolled students.
SELECT cs.courseId AS courseId,c.title AS courseTitle,COUNT(*) AS enrolledStudentsCount
    FROM CourseSection cs
    JOIN SectionStudentsEnrolled sse ON cs.id = sse.sectionId
    JOIN Course c ON cs.courseId = c.id
    GROUP BY cs.courseId, c.title
    HAVING 
        COUNT(DISTINCT sse.studentId) = (
            SELECT COUNT(DISTINCT sse2.studentId)
            FROM SectionStudentsEnrolled sse2
            WHERE sse2.sectionId = cs.id
            GROUP BY sse2.sectionId
            LIMIT 1
        );



-- 28) Retrieve the list of instructors who have taught all courses.
SELECT i.id AS instructorId,CONCAT(i.firstName, ' ', COALESCE(i.middleName, ''), ' ', i.lastName) AS instructorName
    FROM Instructor i
    JOIN CourseSection c ON i.id = c.instructorId
    GROUP BY i.id
    HAVING 
        COUNT(DISTINCT c.id) = (
            SELECT COUNT(*)
            FROM Course
        );



-- 29) Retrieve the list of assignments that have been graded but not returned to the students.
SELECT DISTINCT sa.id AS assignmentId,sa.title AS assignmentTitle
FROM SectionAssignment sa
JOIN SectionAssignmentSubmissions sas ON sa.id = sas.assignmentId
WHERE sas.status <> 2;



-- 30) Retrieve the list of courses that have an average grade higher than the overall grade average.
SELECT c.id AS courseId,c.title AS courseTitle,AVG(sas.score) AS averageGrade
    FROM Course c
    JOIN CourseSection cs ON c.id = cs.courseId
    LEFT JOIN SectionStudentsEnrolled sas ON cs.id = sas.sectionId
    GROUP BY c.id
    HAVING 
        AVG(sas.score) > (
            SELECT 
                AVG(score)
            FROM 
                SectionStudentsEnrolled
        );



-- 31) Retrieve the list of students who have submitted all assignments for a specific course.



-- 32) Retrieve the list of courses that have at least one assignment that no student has submitted.



-- 33) Retrieve the list of students who have submitted the most assignments.



-- 34) Retrieve the list of courses that have the highest average grade among students who have submitted all assignments.



-- 35) Retrieve the list of courses that have the highest average grade among students who have submitted all assignments.



-- 36) Retrieve the list of courses with the highest number of enrollments.



-- 37) Retrieve the list of assignments that have the lowest submission rate.



-- 38) Retrieve the list of students who have the highest average grade for a specific course.



-- 39) Retrieve the list of courses with the highest percentage of students who have completed all assignments.



-- 40) Retrieve the list of students who have not submitted any assignments for a specific course.



-- 41) Retrieve the list of courses with the lowest average grade.



-- 42) Retrieve the list of assignments that have the highest average grade.



-- 43) Retrieve the list of students who have the highest overall grade across all courses.



-- 44) Retrieve the list of assignments that have not been graded yet.



-- 45) Retrieve the list of courses that have not been assigned any assignments yet.



-- 46) Retrieve the list of students who have completed all assignments for a specific course.



-- 47) Retrieve the list of students who have submitted all assignments but have not received a passing grade for a specific course.



-- 48) Retrieve the list of courses that have the highest percentage of students who have received a passing grade.



-- 49) Retrieve the list of students who have submitted assignments late for a specific course.



-- 50) Retrieve the list of courses that have the highest percentage of students who have dropped out.



-- 51) Retrieve the list of students who have not yet submitted any assignments for a specific course.



-- 52) Retrieve the list of students who have submitted at least one assignment for a specific course but have not completed all assignments.



-- 53) Retrieve the list of assignments that have received the highest average grade.



-- 54) Retrieve the list of students who have received the highest average grade across all courses.



-- 55) Retrieve the list of courses that have the highest average grade.



-- 56) Retrieve the list of courses that have at least one student enrolled but no assignments have been created yet.



-- 57) Retrieve the list of courses that have at least one assignment created but no student has enrolled yet.



-- 58) Retrieve the list of students who have submitted all assignments for a specific course.



-- 59) Retrieve the list of courses where the overall average grade is higher than the average grade of a specific student.



-- 60) Retrieve the list of students who have not yet submitted any assignments for any course.
select distinct(s.id) from student as s
join SectionStudentsEnrolled as sse on sse.studentId = s.id
join SectionAssignment as sa on sa.sectionId = sse.sectionId
and s.id not in(
    select distinct(s.id) from student s
    join SectionStudentsEnrolled as sse on sse.studentId = s.id
    join SectionAssignment as sa on sa.sectionId = sse.sectionId
    join SectionAssignmentSubmissions as sas on sas.studentId = s.id
);

-- 61) Retrieve the list of students who have completed all the courses they have enrolled in.
SELECT s.id, s.firstName, s.lastName, enrolled_courses, completed_courses
FROM student AS s
JOIN (
    SELECT s.id AS student_id, 
           COUNT(DISTINCT cs.courseId) AS enrolled_courses,
           COUNT(DISTINCT CASE WHEN sse.grade != 'NC' THEN cs.courseId END) AS completed_courses
    FROM student AS s
    JOIN SectionStudentsEnrolled AS sse ON sse.studentId = s.id
    JOIN CourseSection AS cs ON cs.id = sse.sectionId
    JOIN course AS c ON c.id = cs.courseId
    GROUP BY s.id
) AS course_counts ON s.id = course_counts.student_id
WHERE course_counts.enrolled_courses = course_counts.completed_courses;


-- 62) Retrieve the list of courses where the average grade is lower than a specific threshold.
SELECT cs.courseId, c.title, AVG(CASE sse.grade
                                         WHEN 'A' THEN 4
                                         WHEN 'A-' THEN 3.75
                                         WHEN 'B+' THEN 3.5
                                         WHEN 'B' THEN 3.25
                                         WHEN 'B-' THEN 3
                                         WHEN 'C+' THEN 2.75
                                         WHEN 'C' THEN 2.5
                                         WHEN 'C-' THEN 2.25
                                         WHEN 'NC' THEN 0
                                         ELSE 0
                                       END) AS avg_numeric_grade
FROM SectionStudentsEnrolled AS sse
JOIN CourseSection AS cs ON sse.sectionId = cs.id
JOIN Course AS c ON cs.courseId = c.id
GROUP BY cs.courseId, c.title
HAVING AVG(CASE sse.grade
            WHEN 'A' THEN 4
            WHEN 'A-' THEN 3.75
            WHEN 'B+' THEN 3.5
            WHEN 'B' THEN 3.25
            WHEN 'B-' THEN 3
            WHEN 'C+' THEN 2.75
            WHEN 'C' THEN 2.5
            WHEN 'C-' THEN 2.25
            WHEN 'NC' THEN 0
            ELSE 0
           END) < 2.5;

-- 63) Retrieve the list of courses where the number of students enrolled is less than a specific threshold.
select c.id, c.title, c.code, count(distinct sse.studentId) as no_of_students_enrolled 
from Course as c
join Coursesection as cs on cs.courseId = c.id
join SectionStudentsEnrolled as sse on sse.sectionId = cs.id
group by c.id;
having no_of_students_enrolled < 40;

-- 64) Retrieve the list of students who have not completed a specific course but have submitted all the assignments for that course.



-- 65) Retrieve the list of courses where the average grade is higher than the overall average grade of all courses.



-- 66) Retrieve the list of courses where the average grade is higher than a specific threshold and the number of students enrolled is greater than a specific threshold.



-- 67) Retrieve the list of students who have enrolled in at least two courses and have not submitted any assignments in the past month.



-- 68) Retrieve the list of courses where the percentage of students who have submitted all the assignments is higher than a specific threshold.



-- 69) Retrieve the list of students who have enrolled in a course but have not submitted any assignments.



-- 70) Retrieve the list of courses where the percentage of students who have submitted at least one assignment is lower than a specific threshold.



-- 71) Retrieve the list of students who have submitted an assignment after the due date.



-- 72) Retrieve the list of courses where the average grade of female students is higher than that of male students.



-- 73) Retrieve the list of courses that have at least one female student and no male students.



-- 74) Retrieve the list of students who have submitted at least one assignment in all the courses they are enrolled in.



-- 75) Retrieve the list of students who have not enrolled in any courses.



-- 76) Retrieve the list of courses that have the highest number of enrolled students.



-- 77) Retrieve the list of assignments that have the lowest average grade.



-- 78) Retrieve the list of students who have submitted all the assignments in a particular course.



-- 79) Retrieve the list of courses where the average grade of all students is above 80.



-- 80) Retrieve the list of students who have the highest grade in each course.



-- 81) Retrieve the list of students who have submitted all the assignments on time.



-- 82) Retrieve the list of students who have submitted late submissions for any assignment.



-- 83) Retrieve the list of courses that have the lowest average grade for a particular semester.



-- 84) Retrieve the list of students who have not submitted any assignment for a particular course.



-- 85) Retrieve the list of courses where the highest grade is less than 90.



-- 86) Retrieve the list of students who have submitted all the assignments, but their average grade is less than 70.



-- 87) Retrieve the list of courses that have at least one student with an average grade of 90 or above.



-- 88) Retrieve the list of students who have not submitted any assignments for any of their enrolled courses.



-- 89) Retrieve the list of courses that have at least one student who has not submitted any assignments.



-- 90) Retrieve the list of students who have submitted all the assignments for a particular course.



-- 91) Retrieve the list of assignments that have not been graded yet for a particular course.



-- 92) Retrieve the list of students who have not enrolled in any courses.



-- 93) Retrieve the list of students who have submitted an assignment after the due date.



-- 94) Retrieve the list of courses that have more than 50 enrolled students.



-- 95) Retrieve the list of students who have submitted an assignment for a particular course but have not received a grade yet.