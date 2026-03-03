.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/schema.sql
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/insertion.sql

-- 3.1 
SELECT equipment_id, name, next_maintenance_date
FROM equipment
WHERE next_maintenance_date >= '2025-01-01'
AND next_maintenance_date <= '2025-01-31';

-- 3.2 
SELECT type AS equipment_type,
COUNT(*) AS count
FROM equipment
GROUP BY type;

-- 3.3 
SELECT type, 
AVG(julianday('2025-01-01')) - julianday((purchase_date)) AS avg_age_days
FROM equipment
GROUP BY type;
