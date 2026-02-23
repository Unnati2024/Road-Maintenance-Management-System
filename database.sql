CREATE DATABASE civic_system;

USE civic_system;


-- Users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    role ENUM('CITIZEN', 'OFFICER', 'ADMIN')
);


-- Zones table
CREATE TABLE zones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE
);


-- Officers table
CREATE TABLE officers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    zone_id INT,
    FOREIGN KEY (zone_id) REFERENCES zones(id)
);


-- Reports table
CREATE TABLE reports (
    id INT PRIMARY KEY AUTO_INCREMENT,
    citizen_id INT,
    zone_id INT,
    description TEXT,
    issue_type VARCHAR(100),
    status ENUM('PENDING', 'IN_PROGRESS', 'RESOLVED') DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    assigned_officer_id INT,

    FOREIGN KEY (citizen_id) REFERENCES users(id),
    FOREIGN KEY (zone_id) REFERENCES zones(id),
    FOREIGN KEY (assigned_officer_id) REFERENCES officers(id)
);


-- Mapping officers to zones & issue types
CREATE TABLE officer_assignments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    zone_id INT,
    issue_type VARCHAR(100),
    officer_id INT,

    FOREIGN KEY (zone_id) REFERENCES zones(id),
    FOREIGN KEY (officer_id) REFERENCES officers(id)
);


-- Trigger: Assign officer based on zone & issue type
DELIMITER $$

CREATE TRIGGER assign_officer_trigger
BEFORE INSERT ON reports
FOR EACH ROW
BEGIN
    DECLARE off_id INT;

    SELECT officer_id
    INTO off_id
    FROM officer_assignments
    WHERE zone_id = NEW.zone_id
      AND issue_type = NEW.issue_type
    LIMIT 1;

    IF off_id IS NOT NULL THEN
        SET NEW.assigned_officer_id = off_id;
    END IF;

END$$

DELIMITER ;


USE civic_system;


ALTER TABLE reports
ADD COLUMN latitude DOUBLE;

ALTER TABLE reports
ADD COLUMN longitude DOUBLE;