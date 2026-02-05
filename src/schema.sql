.open fittrackpro.db
.mode box

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


CREATE TABLE locations (

    location_id CHAR(20) PRIMARY KEY,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    phone_number VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    opening_hours VARCHAR NOT NULL

);


CREATE TABLE members (

    member_id CHAR(20) PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    phone_number VARCHAR NOT NULL,
    date_of_birth VARCHAR NOT NULL,
    join_date VARCHAR NOT NULL,
    emergency_contact_name VARCHAR NOT NULL,
    emergency_contact_phone VARCHAR NOT NULL

);

CREATE TABLE staff  (

    staff_id CHAR(20) PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    phone_number VARCHAR NOT NULL,
    position VARCHAR NOT NULL,
    hire_date VARCHAR NOT NULL,
    location_id VARCHAR NOT NULL

);


-- CREATE TABLE equipment  (

--     equipment_id CHAR(20) PRIMARY KEY,
--     name VARCHAR NOT NULL,
--     type VARCHAR NOT NULL,
--     purchase_date VARCHAR NOT NULL,
--     last_maintenance_date VARCHAR NOT NULL,
--     next_maintenance_date VARCHAR NOT NULL,
--     location_id VARCHAR NOT NULL

-- );

