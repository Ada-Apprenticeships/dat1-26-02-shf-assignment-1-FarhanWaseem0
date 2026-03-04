.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/schema.sql
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/insertion.sql


-- 6.1 
INSERT INTO
    attendance
VALUES
    (
        '4',
        '7',
        '1',
        '2025-02-14 16:30:00',
        '2025-02-14 17:30:00'
    );

-- 6.2 
SELECT
    date(check_in_time) AS visit_date,
    check_in_time,
    check_out_time
FROM
    attendance
WHERE
    member_id = '5';


-- 6.3 
SELECT
    strftime('%w', check_in_time) AS day_of_week,
    COUNT(*) AS visit_count
FROM
    attendance
GROUP BY
    day_of_week
ORDER BY
    visit_count DESC
LIMIT
    1;


-- 6.4 
SELECT
    locations.name AS location_name,
    AVG(daily_visits.daily_count) AS avg_daily_attendance
FROM
    (
        SELECT
            attendance.location_id,
            date(attendance.check_in_time) AS visit_date,
            COUNT(*) AS daily_count
        FROM
            attendance
        GROUP BY
            attendance.location_id,
            date(attendance.check_in_time)
    ) AS daily_visits
    JOIN locations ON locations.location_id = daily_visits.location_id
GROUP BY
    locations.name;

