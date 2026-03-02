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
SELECT members.member_id, members.first_name, members.last_name,
COUNT(class_attendance.member_id) AS register_count
FROM members
JOIN class_attendance ON members.member_id = class_attendance.member_id
GROUP BY members.member_id
ORDER BY register_count DESC
LIMIT 1;

-- 1.5
SELECT member_id, COUNT(*) AS Classes_Registered
FROM class_attendance 
GROUP BY member_id
ORDER BY COUNT(*) ASC
LIMIT 1;

-- 1.6
SELECT COUNT()
FROM 
(
    SELECT member_id
    FROM class_attendance
    WHERE attendance_status = 'Attended'
    GROUP BY member_id
    HAVING COUNT() >= 2
)

