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


CREATE TABLE equipment  (

    equipment_id CHAR(20) PRIMARY KEY,
    name VARCHAR NOT NULL,
    type VARCHAR NOT NULL,
    purchase_date VARCHAR NOT NULL,
    last_maintenance_date VARCHAR NOT NULL,
    next_maintenance_date VARCHAR NOT NULL,
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
    start_date VARCHAR NOT NULL,
    end_date VARCHAR NOT NULL,
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
    payment_date VARCHAR NOT NULL,
    payment_method VARCHAR NOT NULL,
    payment_type VARCHAR NOT NULL

);

CREATE TABLE personal_training_sessions  (

    session_id CHAR(20) PRIMARY KEY,
    member_id VARCHAR NOT NULL,
    staff_id VARCHAR NOT NULL,
    session_date VARCHAR NOT NULL,
    start_time VARCHAR NOT NULL,
    end_time VARCHAR NOT NULL,
    notes VARCHAR NOT NULL

);

CREATE TABLE member_health_metrics  (

    metric_id CHAR(20) PRIMARY KEY,
    member_id VARCHAR NOT NULL,
    measurement_date VARCHAR NOT NULL,
    weight VARCHAR NOT NULL,
    body_fat_percentage VARCHAR NOT NULL,
    muscle_mass VARCHAR NOT NULL,
    bmi VARCHAR NOT NULL

);

CREATE TABLE equipment_maintenance_log  (

    log_id CHAR(20) PRIMARY KEY,
    equipment_id VARCHAR NOT NULL,
    maintenance_date VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    staff_id VARCHAR NOT NULL

);


