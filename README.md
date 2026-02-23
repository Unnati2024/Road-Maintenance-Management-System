# Civic Issue Reporting & Officer Assignment System

A role-based Java web application that enables citizens to report road-related issues and helps administrators efficiently assign officers using automated database triggers and real-time geolocation data.

---

##  Project Overview

This application allows citizens to report road and civic issues with precise location detection using Google Geolocation services.  
The system automatically assigns officers based on zone and issue type using database triggers, reducing manual effort and improving response efficiency.

It supports three roles:
- Citizen
- Officer
- Administrator

---

##  Key Features

- Role-based access for Citizens, Officers, and Admins
- Citizens can report road issues with description and location
- Automatic officer assignment using database triggers
- Zone-based and issue-type-based task allocation
- Workload-balanced officer assignment logic
- Real-time latitude and longitude capture for each report
- Officers can track and update issue status
- Admins can manage users, zones and officer mappings

---

##  Tech Stack

- Java
- JDBC
- MySQL
- Google Geolocation API

---

##  System Roles

### Citizen
- Submit road issue reports
- Provide issue type and description
- Automatically capture location

###  Officer
- View assigned issues
- Update status (Pending / In Progress / Resolved)

###  Administrator
- Manage zones and officers
- Define officer-to-zone and issue-type mappings
- Monitor overall issue handling

---

## Database Design Highlights

- Users table for role management
- Zones table for region-wise classification
- Reports table for issue tracking
- Officer assignments table for mapping officers to zones and issue types
- Trigger-based automatic officer assignment

A database trigger assigns an officer before inserting a new report based on:
- selected zone
- selected issue type

---

##  Automated Officer Assignment

Whenever a citizen submits a new report:

1. The selected zone and issue type are captured.
2. A database trigger executes before insertion.
3. The system fetches a suitable officer from the assignment table.
4. The officer is automatically assigned to the report.

This removes the need for manual allocation by administrators.

---

##  Location Tracking

The application integrates Google Geolocation services to fetch:

- Latitude
- Longitude

These values are stored with every report to ensure accurate and traceable issue locations.

---

##  Database

MySQL is used as the backend database.

Important components:
- Foreign key constraints for data integrity
- ENUM-based status management
- Trigger-based automation for officer assignment

---

##  How to Run the Project

1. Clone the repository
2. Create the MySQL database using the provided SQL script
3. Update database credentials in the application
4. Add your Google Geolocation API key
5. Run the Java application

---


---

##  Future Enhancements

- Real-time map visualization of issues
- Priority-based issue handling
- Officer workload analytics dashboard
- Mobile application integration

---

##  Developed By

Unnati Jagtap  
B.Tech – Computer Engineering
