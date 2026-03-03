.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/schema.sql
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/insertion.sql

-- 4.1 
SELECT classes.class_id, classes.name, 
staff.first_name || ' ' || staff.last_name AS instructor_name
FROM classes
JOIN class_schedule ON classes.class_id = class_schedule.class_id
JOIN staff ON class_schedule.staff_id;

-- 4.2 


-- 4.3 
INSERT INTO class_attendance(class_id, schedule_id, member_id, attendance_status)
VALUES (1, 1, 11, 'Registered');

-- 4.4 
DELETE FROM class_attendance
WHERE schedule_id = 7 AND member_id = 3;

-- 4.5 


-- 4.6 
SELECT AVG(class_count) AS average_classes_per_member
FROM
(
    SELECT member_id, COUNT(*) AS class_count
    FROM class_attendance
    WHERE attendance_status IN ('Attended', 'Registered')
    GROUP BY member_id
);
