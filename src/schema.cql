DROP KEYSPACE adm_project;

CREATE KEYSPACE adm_project WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };

USE adm_project;

CREATE TABLE Doctor (
doctor_ID int PRIMARY KEY,
password text,
name text,
surname text,
date_of_birth int,
specialization text
);

CREATE TABLE LaboratoryTechnician (
technician_ID int PRIMARY KEY,
password text,
name text,
surname text,
date_of_birth int,
laboratory_code text
);

CREATE TABLE Treatment (
patient_ID text,
start_date date,
typology text,
end_date date,
prescribed_by int,
description text,
date_of_prescription date,
PRIMARY KEY(patient_ID, start_date, typology)
);

CREATE INDEX doctor_treatment ON adm_project.treatment (prescribed_by);

CREATE TABLE ProfileInformation (
patient_ID text, 
typology text, 
prepared_by int, 
date date, 
description text,
PRIMARY KEY(patient_ID, typology)
);

CREATE TABLE ProfileRecommendedValues (
patient_ID text, 
typology text, 
physiological_parameter text, 
min_recommended_value double, 
max_recommended_value double, 
measurement_unit text,
PRIMARY KEY(patient_ID, typology, physiological_parameter)
);

CREATE TABLE Patient (
patient_health_code text PRIMARY KEY, 
password text, 
name text, 
surname text, 
date_of_birth int, 
telephone_number text, 
home_address text
);

CREATE TABLE PatientSensors ( 
patient_ID text, 
sensor_typology text, 
sensor_serial_number int,
PRIMARY KEY(patient_ID, sensor_typology)
);

CREATE TABLE Warning (
patient_ID text, 
measurement_timestamp timestamp,  
profile_typology text, 
sensor_serial_number int,
measurement_value double, 
warning_timestamp timestamp,
PRIMARY KEY(patient_ID, measurement_timestamp, profile_typology, sensor_serial_number, measurement_value)
);

CREATE TABLE ReportInformation ( 
patient_ID text, 
date timestamp,
typology text, 
written_by int, 
start_date date, 
end_date date, 
notes text,
PRIMARY KEY(patient_ID, date, typology, written_by)
);

CREATE TABLE ReportValues (
patient_ID text, 
date timestamp, 
typology text, 
written_by int, 
physiological_parameter text, 
computed_value double, 
measurement_unit text,
PRIMARY KEY(patient_ID, date, typology, written_by, physiological_parameter)
);

CREATE TABLE Sensor (
sensor_serial_number int PRIMARY KEY, 
typology text, 
description text,
);

CREATE TABLE Measurement (
sensor_serial_number int, 
timestamp timestamp, 
value double, 
measurement_unit text,
PRIMARY KEY(sensor_serial_number, timestamp, value)
);

















