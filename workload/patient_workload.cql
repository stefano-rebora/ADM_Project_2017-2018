-- PATIENT WORKLOAD

USE adm_project;

-- The workload is broken down into operations that require strong consistency or eventual consistency
 
-- For strong consistency

CONSISTENCY LOCAL_QUORUM;

-- 1) Given all the patient’s information, create a unique account for a patient (or remove)

	INSERT INTO Patient (patient_health_code, password, name, surname, date_of_birth, telephone_number, home_address)
	VALUES ('873-12-540', 'password example', 'Monica', 'Verdi', 19751004, '3456766789', 'Piazza Rotonda 30/14A') IF NOT EXISTS; 

	DELETE FROM Patient WHERE patient_health_code = '873-12-540';

-- 2) Log in, given the patient ID and the current password

-- The password validity is check at application level

	SELECT * FROM Patient WHERE patient_health_code = '873-12-539';

-- 3) Change the password, given the patient ID, the old password and the new one

-- The old password validity is check at application level as query 2)

	UPDATE Patient SET password = 'new_password' WHERE patient_health_code = '873-12-539';

	
-- 4) Given the patient ID, get the list of the treatments that the patient has to follow in a given time period

-- as time period, we assume that we are interested in treatments whose start_date is greater than a given value

    SELECT * FROM Treatment WHERE patient_ID = '873-12-539' AND start_date >= '2000-01-01' ;


-- 5) Given the patient ID, associate a new sensor (given all the information about the sensor) to the patient’s account or remove a sensor

-- For associate a new sensor
	
	INSERT INTO PatientSensors (patient_ID, sensor_typology, sensor_serial_number) VALUES ('800-98-474', 'new_typology', 2001);
	
-- before executing the above query, at application level we check if there is already a sensor with the same new typology associated to the patient
-- for example executing the following query

	SELECT * FROM PatientSensors WHERE patient_ID = '800-98-474' AND sensor_typology = 'new_typology';

-- For remove a sensor and his measurements
	
	DELETE FROM PatientSensors WHERE patient_ID = '800-98-474' AND sensor_typology = 'glucose';
	
	DELETE FROM Measurement WHERE sensor_serial_number = 194;
	
	
	
	
-- For eventual consistency

CONSISTENCY ONE;

-- 6) Given the patient ID, visualize the patient’s account information

    SELECT * FROM Patient WHERE patient_health_code = '873-12-539';
	
	
-- 7) Given the patient ID, get the list of the reports in a given time period ( both information and values)

    SELECT * FROM ReportInformation WHERE patient_ID = '504-86-182' AND date > '1950-01-01';
	SELECT * FROM ReportValues WHERE patient_ID = '504-86-182' AND date > '1950-01-01';



-- 8) Given the patient ID, get the list of all profiles ( both information and values) 

   SELECT * FROM ProfileInformation WHERE patient_ID = '504-86-182';
   SELECT * FROM ProfileRecommendedValues WHERE patient_ID = '504-86-182';	
	

-- 9)Given the patient ID, get the list of all sensors connected to the patient

	SELECT * FROM PatientSensors WHERE patient_ID = '800-98-474';
