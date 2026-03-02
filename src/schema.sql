.open fittrackpro.db
.mode box
PRAGMA foreign_keys = ON;

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
    phone_number VARCHAR NOT NULL CHECK (phone_number GLOB '[0-9 ]*'),
    email VARCHAR NOT NULL CHECK (email LIKE '%@%.%'),
    opening_hours VARCHAR NOT NULL CHECK (opening_hours GLOB '[0-9][0-9]:[0-9][0-9]-[0-9][0-9]:[0-9][0-9]')

);


CREATE TABLE members (

    member_id CHAR(20) PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL CHECK (email LIKE '%@%.%'),
    phone_number VARCHAR NOT NULL CHECK (phone_number GLOB '[0-9 ]*'),
    date_of_birth TEXT NOT NULL CHECK (date(date_of_birth) IS NOT NULL),
    join_date TEXT NOT NULL CHECK (date(join_date) IS NOT NULL),
    emergency_contact_name VARCHAR NOT NULL,
    emergency_contact_phone VARCHAR NOT NULL CHECK (emergency_contact_phone GLOB '[0-9 ]*')

);

CREATE TABLE staff  (

    staff_id CHAR(20) PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL CHECK (email LIKE '%@%.%'),
    phone_number VARCHAR NOT NULL CHECK (phone_number GLOB '[0-9 ]*'),
    position VARCHAR NOT NULL CHECK (position IN ('Trainer','Manager','Receptionist','Maintenance')),
    hire_date TEXT NOT NULL CHECK (date(hire_date) IS NOT NULL),
    location_id VARCHAR NOT NULL

);


CREATE TABLE equipment  (

    equipment_id CHAR(20) PRIMARY KEY,
    name VARCHAR NOT NULL,
    type VARCHAR NOT NULL CHECK (type IN ('Cardio','Strength')),
    purchase_date TEXT NOT NULL CHECK (date(purchase_date) IS NOT NULL),
    last_maintenance_date TEXT NOT NULL CHECK (date(last_maintenance_date) IS NOT NULL),
    next_maintenance_date TEXT NOT NULL CHECK (date(next_maintenance_date) IS NOT NULL),
    location_id VARCHAR NOT NULL

);


CREATE TABLE classes  (

    class_id CHAR(20) PRIMARY KEY,
    name VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    capacity VARCHAR NOT NULL,
    duration VARCHAR NOT NULL,
    location_id VARCHAR NOT NULL

);


CREATE TABLE class_schedule  (

    schedule_id CHAR(20) PRIMARY KEY,
    class_id VARCHAR NOT NULL,
    staff_id VARCHAR NOT NULL,
    start_time VARCHAR NOT NULL,
    end_time VARCHAR NOT NULL

);

CREATE TABLE memberships  (

    membership_id CHAR(20) PRIMARY KEY,
    member_id VARCHAR NOT NULL,
    type VARCHAR NOT NULL,
    start_date TEXT NOT NULL CHECK (date(start_date) IS NOT NULL),
    end_date TEXT NOT NULL CHECK (date(end_date) IS NOT NULL),
    status VARCHAR NOT NULL

);

CREATE TABLE attendance  (

    attendance_id CHAR(20) PRIMARY KEY,
    member_id VARCHAR NOT NULL,
    location_id VARCHAR NOT NULL,
    check_in_time VARCHAR NOT NULL,
    check_out_time VARCHAR NOT NULL

);

CREATE TABLE class_attendance  (

    class_attendance_id CHAR(20) PRIMARY KEY,
    schedule_id VARCHAR NOT NULL,
    member_id VARCHAR NOT NULL,
    attendance_status VARCHAR NOT NULL

);

CREATE TABLE payments  (

    payment_id CHAR(20) PRIMARY KEY,
    member_id VARCHAR NOT NULL,
    amount VARCHAR NOT NULL,
    payment_date TEXT NOT NULL CHECK (date(payment_date) IS NOT NULL),
    payment_method VARCHAR NOT NULL,
    payment_type VARCHAR NOT NULL

);

CREATE TABLE personal_training_sessions  (

    session_id CHAR(20) PRIMARY KEY,
    member_id VARCHAR NOT NULL,
    staff_id VARCHAR NOT NULL,
    session_date TEXT NOT NULL CHECK (date(session_date) IS NOT NULL),
    start_time VARCHAR NOT NULL,
    end_time VARCHAR NOT NULL,
    notes VARCHAR NOT NULL,

    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)

);

CREATE TABLE member_health_metrics  (

    metric_id CHAR(20) PRIMARY KEY,
    member_id VARCHAR NOT NULL,
    measurement_date TEXT NOT NULL CHECK (date(measurement_date) IS NOT NULL),
    weight VARCHAR NOT NULL,
    body_fat_percentage VARCHAR NOT NULL,
    muscle_mass VARCHAR NOT NULL,
    bmi VARCHAR NOT NULL,

    FOREIGN KEY (member_id) REFERENCES members(member_id)

);

CREATE TABLE equipment_maintenance_log  (

    log_id CHAR(20) PRIMARY KEY,
    equipment_id VARCHAR NOT NULL,
    maintenance_date TEXT NOT NULL CHECK (date(maintenance_date) IS NOT NULL),
    description VARCHAR NOT NULL,
    staff_id VARCHAR NOT NULL,

    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)

);

 