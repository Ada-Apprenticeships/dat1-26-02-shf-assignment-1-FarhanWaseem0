.read schema.sql
.read insertion.sql
.open fittrackpro.db
.mode column

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
GROUP member_id
ORDER Classes_Registration DESC
LIMIT 1;

-- 1.5


-- 1.6

