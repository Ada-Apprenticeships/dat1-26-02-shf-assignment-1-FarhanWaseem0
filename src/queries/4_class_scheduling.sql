.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/schema.sql
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/insertion.sql

-- 4.1 


-- 4.2 


-- 4.3 
INSERT INTO class_attendance(class_id, schedule_id, member_id, attendance_status)
VALUES (1, 1, 11, 'Registered');

-- 4.4 
DELETE FROM class_attendance
WHERE schedule_id = 7 AND member_id = 3;

-- 4.5 


-- 4.6 

