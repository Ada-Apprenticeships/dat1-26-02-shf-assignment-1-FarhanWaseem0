.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/schema.sql
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/insertion.sql


-- 7.1 
SELECT
  staff_id,
  first_name,
  last_name,
  position AS role
FROM
  staff
ORDER BY
  position;

-- 7.2 
SELECT
  staff.staff_id AS trainer_id,
  staff.first_name || ' ' || staff.last_name AS trainer_name,
  COUNT (personal_training_sessions.session_id) AS session_count
FROM
  staff
  JOIN personal_training_sessions ON staff.staff_id = personal_training_sessions.staff_id
WHERE
  staff.position = 'Trainer'
  AND personal_training_sessions.session_date >= '2025-01-20'
  AND personal_training_sessions.session_date <= '2025-02-19'
GROUP BY
  staff.staff_id,
  staff.first_name,
  staff.last_name;

