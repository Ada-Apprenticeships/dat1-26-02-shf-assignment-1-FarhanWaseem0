.open fittrackpro.db
.mode column

-- For dropping the tables when not needed
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS class_schedule;
DROP TABLE IF EXISTS memberships;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS class_attendance;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS personal_training_sessions;
DROP TABLE IF EXISTS member_health_metrics;
DROP TABLE IF EXISTS equipment_maintenance_log;


CREATE TABLE locations  (

    location_id         CHAR(20) PRIMARY KEY,
    name                VARCHAR NOT NULL,
    address             VARCHAR NOT NULL,
    phone_number        VARCHAR NOT NULL,
    email               VARCHAR NOT NULL,
    opening_hours       VARCHAR NOT NULL,

);
