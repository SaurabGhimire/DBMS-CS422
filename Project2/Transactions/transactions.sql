-- READ UNCOMMITED
-- Set isolation level to Read Uncommitted
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- Reset price to 150 before transaction
UPDATE stocks SET price = 150.00 WHERE id = 1;

-- Transaction 1: Start transaction and update stock price
START TRANSACTION;
UPDATE stocks SET price = 155.00 WHERE id = 1;

-- Transaction 2: Start another transaction and read stock price
START TRANSACTION;
SELECT price FROM stocks WHERE id = 1;
-- Expected: 155.00 (dirty read), Actual: 155.00

COMMIT;

-- Transaction 2: Read stock price again
SELECT price FROM stocks WHERE id = 1;
-- Expected: 155.00, Actual: 155.00

-- Commit Transaction 2
COMMIT;

-- READ COMMITTED
-- Set isolation level to Read Committed
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Transaction 1: Start transaction and update stock price
-- Reset price to 150 before transaction
UPDATE stocks SET price = 150.00 WHERE id = 1;

START TRANSACTION;
UPDATE stocks SET price = 155.00 WHERE id = 1;

-- Transaction 2: Start another transaction and read stock price
START TRANSACTION;
SELECT price FROM stocks WHERE id = 1;
-- Expected: 150.00 (no dirty read), Actual: 150.00

-- Commit Transaction 1
COMMIT;

-- Transaction 2: Read stock price again
SELECT price FROM stocks WHERE id = 1;
-- Expected: 155.00, Actual: 155.00

-- Commit Transaction 2
COMMIT;

-- REPEATABLE READ
-- Set isolation level to Repeatable Read
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Reset price to 150 before transaction
UPDATE stocks SET price = 150.00 WHERE id = 1;

-- Transaction 1: Start transaction and read stock price
START TRANSACTION;
SELECT price FROM stocks WHERE id = 1;
-- Expected: 150.00, Actual: 150.00

-- Transaction 2: Start another transaction and update stock price
START TRANSACTION;
UPDATE stocks SET price = 155.00 WHERE id = 1;
-- Commit Transaction 2
COMMIT;

-- Transaction 1: Read stock price again
SELECT price FROM stocks WHERE id = 1;
-- Expected: 150.00 (repeatable read), Actual: 150.00

-- Commit Transaction 1
COMMIT;

-- Check final state of the stock price
SELECT price FROM stocks WHERE id = 1;
-- Expected: 155.00, Actual: 155.00

-- SERIALIZABLE READ
-- Set isolation level to Serializable
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Reset price to 150 before transaction
UPDATE stocks SET price = 150.00 WHERE id = 1;

-- Transaction 1: Start transaction and read stock price
START TRANSACTION;
SELECT price FROM stocks WHERE id = 1;
-- Expected: 150.00, Actual: 150.00

-- Transaction 2: Start another transaction and try to update stock price
START TRANSACTION;
UPDATE stocks SET price = 155.00 WHERE id = 1;
-- Expected: Block until Transaction 1 is committed or rolled back

-- Commit Transaction 1
COMMIT;

-- Transaction 2: Now able to update stock price
-- Commit Transaction 2
COMMIT;

-- Check final state of the stock price
SELECT price FROM stocks WHERE id = 1;
-- Expected: 155.00, Actual: 155.00
