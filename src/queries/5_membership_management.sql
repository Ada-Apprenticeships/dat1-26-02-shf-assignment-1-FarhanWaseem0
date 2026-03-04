.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box


-- 5.1 
SELECT
    members.member_id,
    members.first_name,
    members.last_name,
    memberships.type AS membership_type,
    members.join_date
FROM
    memberships
    JOIN members ON memberships.member_id = members.member_id
WHERE
    memberships.status = 'Active';


-- 5.2 
-- Calculate the average visit duration (in minutes) for each membership type.
-- Duration is calculated using the difference between check-in and check-out times.
SELECT
    memberships.type AS membership_type,
    AVG(
        (
            julianday(attendance.check_out_time) - julianday(attendance.check_in_time)
        ) * 1440
    ) AS avg_visit_duration_minutes
FROM
    attendance
    JOIN memberships ON attendance.member_id = memberships.member_id
GROUP BY
    memberships.type;


-- 5.3 
-- Retrieve members whose memberships expire during 2025.
-- This filters membership end dates within the specified range.
SELECT
    members.member_id,
    members.first_name,
    members.last_name,
    members.email,
    memberships.end_date
FROM
    memberships
    JOIN members ON memberships.member_id = members.member_id
WHERE
    memberships.end_date BETWEEN '2025-01-01'
    AND '2025-12-31';

