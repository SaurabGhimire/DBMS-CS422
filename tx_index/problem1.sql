-- Index Analysis:
-- a. Select three sample queries that involve different tables and columns from your database schema.

-- Query 1 To get the member with the highest number of assignments
SET @start_time = NOW(4);
SELECT SQL_NO_CACHE m.member_id, m.member_name, m.member_email, COUNT(ta.assignment_id) AS num_assignments
    FROM Members m
    JOIN TaskAssignments ta ON m.member_id = ta.member_id
    GROUP BY m.member_id
    ORDER BY num_assignments DESC
    LIMIT 1;
SET @end_time = NOW(4);
SELECT TIMEDIFF(@end_time, @start_time) AS execution_time;

-- Query 2 Find members who have completed tasks with a priority higher than the average priority and were completed recently.
SET @start_time = NOW(4);
SELECT m.member_id, m.member_name, AVG(t.task_priority) AS avg_priority, COUNT(ta.task_id) AS num_completed_tasks
FROM Members m
JOIN TaskAssignments ta ON m.member_id = ta.member_id
JOIN Tasks t ON ta.task_id = t.task_id
WHERE ta.completed_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
GROUP BY m.member_id, m.member_name
HAVING AVG(t.task_priority) > (SELECT AVG(task_priority) FROM Tasks WHERE status = 1) 
   AND COUNT(ta.task_id) > 5; 
SET @end_time = NOW(4);
SELECT TIMEDIFF(@end_time, @start_time) AS execution_time;

-- Query 3 Specify the member name you want to retrieve tasks for
SET @start_time = NOW(4);
SELECT SQL_NO_CACHE t.task_name,t.task_due_date,t.task_priority
    FROM Tasks t
    JOIN TaskAssignments ta ON t.task_id = ta.task_id
    JOIN Members m ON ta.member_id = m.member_id
    WHERE m.member_name like "%son%"; 
SET @end_time = NOW(4);
SELECT TIMEDIFF(@end_time, @start_time) AS execution_time;


-- b. Execute each query multiple times, measuring the execution time without any indexes.
-- Execute if only exists
ALTER TABLE `Members` DROP INDEX `idx_member_name`;
ALTER TABLE `TaskAssignments` DROP INDEX `idx_completed_date`;
ALTER TABLE `Tasks` DROP INDEX `idx_task_priority`;

/*

Query 1 Execution time noticed
    +-----------------+
    | execution_time  |
    +-----------------+
    | 00:00:00.014300 |
    +-----------------+


Query 2 Execution time noticed
    +-----------------+
    | execution_time  |
    +-----------------+
    | 00:00:00.029700 |
    +-----------------+

Query 3 Execution time noticed
    +-----------------+
    | execution_time  |
    +-----------------+
    | 00:00:00.014100 |
    +-----------------+

*/
-- c. Apply appropriate indexes on the required columns involved in the queries.
CREATE INDEX idx_member_name ON Members (member_name);
CREATE INDEX idx_completed_date ON TaskAssignments (completed_date);
CREATE INDEX idx_task_priority ON Tasks (task_priority);


/* d. Re-execute the queries multiple times, measuring the execution time with indexes.
Query 1 Execution time noticed after indexing
    +-----------------+
    | execution_time  |
    +-----------------+
    | 00:00:00.006170 |
    +-----------------+

Query 2 Execution time noticed after indexing
    +-----------------+
    | execution_time  |
    +-----------------+
    | 00:00:00.012600 |
    +-----------------+

Query 3 Execution time noticed after indexing
    +-----------------+
    | execution_time  |
    +-----------------+
    | 00:00:00.014300 |
    +-----------------+
*/

-- e. Record the execution times for each query, both before and after index creation.
/* 
It is found with index the query performance has increased by more than 
Query 1: 118.3 % performance boost
Query 2: 57.58 % performance boost
Query 3: 1.4% performance loss

*/
-- f. Analyze the results and describe the impact of indexing on query performance. Discuss any significant improvements or drawbacks observed.
/*
    Overall it is found index has positive impact in query performance.
*/