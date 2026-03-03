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
SELECT class_schedule.class_id,
    classes.name AS name,
    class_schedule.start_time,
    class_schedule.end_time,
    classes.capacity - COUNT(class_attendance.member_id) AS available_spots
FROM class_schedule
JOIN classes ON class_schedule.class_id = classes.class_id
LEFT JOIN class_attendance
    ON class_schedule.schedule_id = class_attendance.schedule_id
    AND class_attendance.attendance_status IN ('Attended', 'Registered')
WHERE date(class_schedule.start_time) = '2025-02-01'
GROUP BY class_schedule.schedule_id;


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
