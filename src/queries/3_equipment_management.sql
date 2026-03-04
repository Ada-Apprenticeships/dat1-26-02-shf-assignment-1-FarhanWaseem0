.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box


-- 3.1 
SELECT
    equipment_id,
    name,
    next_maintenance_date
FROM
    equipment
WHERE
    next_maintenance_date >= '2025-01-01'
    AND next_maintenance_date <= '2025-01-31';


-- 3.2 
SELECT
    type AS equipment_type,
    COUNT(*) AS count
FROM
    equipment
GROUP BY
    type;


-- 3.3 
-- Calculate the average age (in days) of equipment by type
-- using current date as the reference date
SELECT
    type,
    AVG(julianday(Date('now'))) - julianday((purchase_date)) AS avg_age_days
FROM
    equipment
GROUP BY
    type;
