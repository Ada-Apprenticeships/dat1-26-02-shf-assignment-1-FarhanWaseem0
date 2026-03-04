.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/schema.sql
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/insertion.sql

-- 8.1 
SELECT
    personal_training_sessions.session_id,
    members.first_name || ' ' || members.last_name AS member_name,
    personal_training_sessions.session_date,
    personal_training_sessions.start_time,
    personal_training_sessions.end_time
FROM
    personal_training_sessions
    JOIN staff ON personal_training_sessions.staff_id = staff.staff_id
    JOIN members ON personal_training_sessions.member_id = members.member_id
WHERE
    staff.first_name = 'Ivy'
    AND staff.last_name = 'Irwin';
