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
start_date int,
typology text,
end_date int,
prescribed_by int,
description text,
date_of_prescription int,
PRIMARY KEY(patient_ID, start_date, typology)
);

CREATE TABLE ProfileInformation (
patient_ID text, 
typology text, 
prepared_by int, 
date timestamp, 
description text,
PRIMARY KEY(patient_ID, typology)
);

ProfileRecommendedValues (
patient_ID text, 
typology text, 
physiological_parameter text, 
min_recommended_value double, 
max_recommended_value double, 
measurement_unit text,
PRIMARY KEY(patient_ID, typology, physiological_parameter)
);

Patient (
patient_health_code text PRIMARY KEY, 
password text, 
name text, 
surname text, 
date_of_birth int, 
telephone_number int, 
home_address text
);

PatientSensors ( 
patient_ID text, 
sensor_typology text, 
sensor_serial_number int,
PRIMARY KEY(patient_ID, sensor_typology)
);

Warning (
patient_ID text, 
measurement_timestamp timestamp,  
profile_typology text, 
sensor_serial_number int,
measurement_value double, 
warning_timestamp timestamp,
PRIMARY KEY(patient_ID, measurement_timestamp, profile_typology, sensor_serial_number, measurement_value)
);

ReportInformation ( 
patient_ID text, 
date int,
typology text, 
written_by int, 
start_date timestamp, 
end_date timestamp, 
notes text,
PRIMARY KEY(patient_ID, date, typology, written_by)
);

ReportValues (
patient_ID text, 
date int, 
typology text, 
written_by int, 
physiological_parameter text, 
computed_value double, 
measurement_unit text
PRIMARY KEY(patient_ID, date, typology, written_by, physiological_parameter)
);

Sensor (
sensor_serial_number int PRIMARY KEY, 
typology text, 
description text,
);

Measurement (
sensor_serial_number int, 
timestamp timestamp, 
value double, 
measurement_unit text,
PRIMARY KEY(sensor_serial_number, timestamp, value)
);


















