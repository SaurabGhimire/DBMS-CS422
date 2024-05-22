Drop Database If Exists DBMS_CS422_TX_INDEX;
Create Database DBMS_CS422_TX_INDEX;
use DBMS_CS422_TX_INDEX;

-- Tasks table
CREATE TABLE Tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    task_name VARCHAR(100),
    task_description TEXT,
    task_due_date DATE,
    task_priority INT,
    status int COMMENT "1-> not completed 2 -> completed"
);

-- Members table
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(100),
    member_email VARCHAR(100)
);

-- TaskAssignments table
CREATE TABLE TaskAssignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT,
    member_id INT,
    assigned_date DATE,
    completed_date DATE,
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);