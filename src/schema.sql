.open fittrackpro.db
.mode box
PRAGMA foreign_keys = ON;

-- For dropping the tables when not needed
DROP TABLE IF EXISTS equipment_maintenance_log;
DROP TABLE IF EXISTS member_health_metrics;
DROP TABLE IF EXISTS personal_training_sessions;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS class_attendance;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS memberships;
DROP TABLE IF EXISTS class_schedule;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS locations;


CREATE TABLE locations (

    location_id CHAR(20) PRIMARY KEY CHECK (location_id GLOB '[0-9]*'),
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    phone_number VARCHAR NOT NULL CHECK (phone_number GLOB '[0-9 ]*'),
    email VARCHAR NOT NULL CHECK (email LIKE '%@%.%'),
    opening_hours VARCHAR NOT NULL CHECK (opening_hours GLOB '[0-9][0-9]:[0-9][0-9]-[0-9][0-9]:[0-9][0-9]')

);


CREATE TABLE members (

    member_id CHAR(20) PRIMARY KEY CHECK (member_id GLOB '[0-9]*'),
    first_name VARCHAR NOT NULL CHECK (first_name GLOB '[A-Za-z]*'),
    last_name VARCHAR NOT NULL CHECK (last_name GLOB '[A-Za-z]*'),
    email VARCHAR NOT NULL CHECK (email LIKE '%@%.%'),
    phone_number VARCHAR NOT NULL CHECK (phone_number GLOB '[0-9 ]*'),
    date_of_birth TEXT NOT NULL CHECK (date(date_of_birth) IS NOT NULL),
    join_date TEXT NOT NULL CHECK (date(join_date) IS NOT NULL),
    emergency_contact_name VARCHAR NOT NULL,
    emergency_contact_phone VARCHAR NOT NULL CHECK (emergency_contact_phone GLOB '[0-9 ]*')

);

CREATE TABLE staff  (

    staff_id CHAR(20) PRIMARY KEY CHECK (staff_id GLOB '[0-9]*'),
    first_name VARCHAR NOT NULL CHECK (first_name GLOB '[A-Za-z]*'),
    last_name VARCHAR NOT NULL CHECK (last_name GLOB '[A-Za-z]*'),
    email VARCHAR NOT NULL CHECK (email LIKE '%@%.%'),
    phone_number VARCHAR NOT NULL CHECK (phone_number GLOB '[0-9 ]*'),
    position VARCHAR NOT NULL CHECK (position IN ('Trainer','Manager','Receptionist','Maintenance')),
    hire_date TEXT NOT NULL CHECK (date(hire_date) IS NOT NULL),
    location_id VARCHAR NOT NULL CHECK (location_id GLOB '[0-9]*'),

    FOREIGN KEY (location_id) REFERENCES locations(location_id)

);


CREATE TABLE equipment  (

    equipment_id CHAR(20) PRIMARY KEY CHECK (equipment_id GLOB '[0-9]*'),
    name VARCHAR NOT NULL,
    type VARCHAR NOT NULL CHECK (type IN ('Cardio','Strength')),
    purchase_date TEXT NOT NULL CHECK (date(purchase_date) IS NOT NULL),
    last_maintenance_date TEXT NOT NULL CHECK (date(last_maintenance_date) IS NOT NULL),
    next_maintenance_date TEXT NOT NULL CHECK (date(next_maintenance_date) IS NOT NULL),
    location_id VARCHAR NOT NULL CHECK (location_id GLOB '[0-9]*'),

    FOREIGN KEY (location_id) REFERENCES locations(location_id)

);


CREATE TABLE classes  (

    class_id CHAR(20) PRIMARY KEY CHECK (class_id GLOB '[0-9]*'),
    name VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    capacity VARCHAR NOT NULL CHECK (capacity GLOB '[0-9]*'),
    duration VARCHAR NOT NULL CHECK (duration GLOB '[0-9]*'),
    location_id CHECK (location_id GLOB '[0-9]*'),

    FOREIGN KEY (location_id) REFERENCES locations(location_id)

);


CREATE TABLE class_schedule  (

    schedule_id CHAR(20) PRIMARY KEY CHECK (schedule_id GLOB '[0-9]*'),
    class_id CHAR(20) CHECK (class_id GLOB '[0-9]*'),
    staff_id VCHAR(20) CHECK (staff_id GLOB '[0-9]*'),
    start_time VARCHAR NOT NULL CHECK (datetime(start_time) IS NOT NULL),
    end_time VARCHAR NOT NULL CHECK (datetime(end_time) IS NOT NULL),

    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)

);

CREATE TABLE memberships  (

    membership_id CHAR(20) PRIMARY KEY CHECK (membership_id GLOB '[0-9]*'),
    member_id VARCHAR NOT NULL CHECK (member_id GLOB '[0-9]*'),
    type VARCHAR NOT NULL CHECK (type IN ('Standard','Premium')),
    start_date TEXT NOT NULL CHECK (date(start_date) IS NOT NULL),
    end_date TEXT NOT NULL CHECK (date(end_date) IS NOT NULL),
    status VARCHAR NOT NULL CHECK (status IN ('Active','Inactive')),

    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE attendance  (

    attendance_id CHAR(20) PRIMARY KEY CHECK (attendance_id GLOB '[0-9]*'),
    member_id VARCHAR NOT NULL CHECK (member_id GLOB '[0-9]*'),
    location_id VARCHAR NOT NULL CHECK (location_id GLOB '[0-9]*'),
    check_in_time VARCHAR NOT NULL CHECK (datetime(check_in_time) IS NOT NULL),
    check_out_time VARCHAR NOT NULL CHECK (datetime(check_out_time) IS NOT NULL),

    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE class_attendance  (

    class_attendance_id CHAR(20) PRIMARY KEY CHECK (class_attendance_id GLOB '[0-9]*'),
    schedule_id VARCHAR NOT NULL CHECK (schedule_id GLOB '[0-9]*'),
    member_id VARCHAR NOT NULL CHECK (member_id GLOB '[0-9]*'),
    attendance_status VARCHAR NOT NULL CHECK (attendance_status IN ('Registered','Attended','Unattended')),

    FOREIGN KEY (schedule_id) REFERENCES class_schedule(schedule_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)

);

CREATE TABLE payments  (

    payment_id CHAR(20) PRIMARY KEY CHECK (payment_id GLOB '[0-9]*'),
    member_id VARCHAR NOT NULL CHECK (member_id GLOB '[0-9]*'),
    amount VARCHAR NOT NULL CHECK (amount GLOB '[0-9]*.[0-9][0-9]'),
    payment_date TEXT NOT NULL CHECK (date(payment_date) IS NOT NULL),
    payment_method VARCHAR NOT NULL CHECK (payment_method IN ('Credit Card','Bank Transfer','PayPal','Cash')),
    payment_type VARCHAR NOT NULL CHECK (payment_type IN ('Monthly membership fee','Day pass')),

    FOREIGN KEY (member_id) REFERENCES members(member_id)

);

CREATE TABLE personal_training_sessions  (

    session_id CHAR(20) PRIMARY KEY CHECK (session_id GLOB '[0-9]*'),
    member_id VARCHAR NOT NULL CHECK (member_id GLOB '[0-9]*'),
    staff_id VARCHAR NOT NULL CHECK (staff_id GLOB '[0-9]*'),
    session_date TEXT NOT NULL CHECK (date(session_date) IS NOT NULL),
    start_time VARCHAR NOT NULL CHECK (time(start_time) IS NOT NULL),
    end_time VARCHAR NOT NULL CHECK (time(end_time) IS NOT NULL),
    notes VARCHAR NOT NULL,

    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)

);

CREATE TABLE member_health_metrics  (

    metric_id CHAR(20) PRIMARY KEY CHECK (metric_id GLOB '[0-9]*'),
    member_id VARCHAR NOT NULL CHECK (member_id GLOB '[0-9]*'),
    measurement_date TEXT NOT NULL CHECK (date(measurement_date) IS NOT NULL),
    weight VARCHAR NOT NULL,
    body_fat_percentage VARCHAR NOT NULL CHECK (body_fat_percentage GLOB '[0-9]*.[0-9]*'),
    muscle_mass VARCHAR NOT NULL CHECK (muscle_mass GLOB '[0-9]*.[0-9]*'),
    bmi VARCHAR NOT NULL CHECK (bmi GLOB '[0-9]*.[0-9]*'),

    FOREIGN KEY (member_id) REFERENCES members(member_id)

);

CREATE TABLE equipment_maintenance_log  (

    log_id CHAR(20) PRIMARY KEY CHECK (log_id GLOB '[0-9]*'),
    equipment_id VARCHAR NOT NULL CHECK (equipment_id GLOB '[0-9]*'),
    maintenance_date TEXT NOT NULL CHECK (date(maintenance_date) IS NOT NULL),
    description VARCHAR NOT NULL,
    staff_id VARCHAR NOT NULL CHECK (staff_id GLOB '[0-9]*'),

    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)

);

 