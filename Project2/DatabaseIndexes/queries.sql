-- Query 1 To get the member with the highest number of assignments
-- SET @start_time = NOW(4);
SELECT SQL_NO_CACHE m.member_id, m.member_name, m.member_email, COUNT(ta.assignment_id) AS num_assignments
   FROM Members m
   JOIN TaskAssignments ta ON m.member_id = ta.member_id
   GROUP BY m.member_id
   ORDER BY num_assignments DESC
   LIMIT 1;

-- Query 2 Find members who have completed tasks with a priority higher than the average priority and were completed recently.
SELECT SQL_NO_CACHE m.member_id, m.member_name, AVG(t.task_priority) AS avg_priority, COUNT(ta.task_id) AS num_completed_tasks
FROM Members m
JOIN TaskAssignments ta ON m.member_id = ta.member_id
JOIN Tasks t ON ta.task_id = t.task_id
WHERE ta.completed_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
GROUP BY m.member_id, m.member_name
HAVING AVG(t.task_priority) > (SELECT AVG(task_priority) FROM Tasks WHERE status = 1)
  AND COUNT(ta.task_id) > 5 LIMIT 10;


-- Query 3 Specify the member name you want to retrieve tasks for
SELECT SQL_NO_CACHE t.task_name,t.task_due_date,t.task_priority
   FROM Tasks t
   JOIN TaskAssignments ta ON t.task_id = ta.task_id
   JOIN Members m ON ta.member_id = m.member_id
   WHERE m.member_name like "%son%" limit 10;


-- Query 4: updating the task_due_date of tasks assigned to members who have not completed any tasks yet to be 
-- one month later than their current task_due_date
UPDATE Tasks
SET task_due_date = DATE_ADD(task_due_date, INTERVAL 1 WEEK)
WHERE task_id IN (
    SELECT ta.task_id
    FROM TaskAssignments ta
    INNER JOIN Members m ON ta.member_id = m.member_id
    WHERE ta.member_id NOT IN (
        SELECT member_id
        FROM TaskAssignments
        WHERE status = 2
    )
);
-- SET @end_time = NOW(4);
-- SELECT TIMEDIFF(@end_time, @start_time) AS execution_time;