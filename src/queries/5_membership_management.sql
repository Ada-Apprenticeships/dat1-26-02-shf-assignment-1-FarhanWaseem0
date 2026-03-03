.open fittrackpro.db
PRAGMA foreign_keys = ON;
.mode box
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/schema.sql
.read /workspaces/dat1-26-02-shf-assignment-1-FarhanWaseem0/src/insertion.sql

-- 5.1 
SELECT members.member_id,
members.first_name,
members.last_name,
memberships.type AS membership_type,
members.join_date
FROM memberships
JOIN members
ON memberships.member_id = members.member_id
WHERE memberships.status = 'Active';


-- 5.2 
SELECT 




-- 5.3 

