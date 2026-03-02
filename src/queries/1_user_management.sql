.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box

.read schema.sql
.read insertion.sql

-- 1.1
.print
SELECT member_id, first_name, last_name, email, join_date
FROM members;

-- 1.2
.print
UPDATE members
SET phone_number = '07000 100005', email = 'emily.jones.updated@email.com'
WHERE member_id = 5;

-- 1.3
.print
SELECT COUNT(*) AS Members_Total
FROM members;

-- 1.4
.print
SELECT member_id, COUNT(*) AS Classes_Registered
FROM class_attendance 
GROUP BY member_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 1.5


-- 1.6

