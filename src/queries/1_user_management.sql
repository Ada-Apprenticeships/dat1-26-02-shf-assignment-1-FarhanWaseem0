.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/schema.sql
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/insertion.sql

-- 1.1
SELECT member_id, first_name, last_name, email, join_date
FROM members;

-- 1.2
UPDATE members
SET phone_number = '07000 100005', email = 'emily.jones.updated@email.com'
WHERE member_id = 5;

-- 1.3
SELECT COUNT(*) AS Members_Total
FROM members;

-- 1.4
SELECT member_id, COUNT(*) AS Classes_Registered
FROM class_attendance 
GROUP BY member_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 1.5


-- 1.6

