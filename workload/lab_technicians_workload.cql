
-- LABORATORY TECHNICIANS WORKLOAD

USE adm_project;

-- For strong consistency

CONSISTENCY LOCAL_QUORUM;

-- 1) Given all the laboratory technician’s information, create a unique account for the lab. technician (or remove)

	INSERT INTO LaboratoryTechnician (technician_ID, password, name, surname, date_of_birth, laboratory_code)
	VALUES (401, 'a quite-strong password', 'Mark', 'House', 19851005, 'BIOLAB01') IF NOT EXISTS;

	DELETE FROM LaboratoryTechnician WHERE technician_ID = 401;
	
-- 2) Log in, given the technician ID and the current password

	-- The password validity is checked at application level

	SELECT * FROM LaboratoryTechnician WHERE technician_ID = 205;	

-- 3) Change the password, given the technician ID, the old password and the new one

	-- The old password validity is checked at application level as query 2)

	UPDATE LaboratoryTechnician SET password = 'new_password' WHERE technician_ID = 205;

-- 4) Given the technician ID, visualize the technician’s account information

	SELECT * FROM LaboratoryTechnician WHERE technician_ID = 205;

-- 5) Given a patient ID, visualize the patient’s account information

	SELECT * FROM Patient WHERE patient_health_code = '504-86-182';

-- 6) Get the list of all profiles of a patient (both information and values) 

	SELECT * FROM ProfileInformation WHERE patient_ID = '504-86-182';
   	SELECT * FROM ProfileRecommendedValues WHERE patient_ID = '504-86-182';

-- 7) Get the list of warnings of a given patient in a given time period

	-- as time period, we assume that we are interested in warnings whose measurement_timestamp is greater or equal than a given value

	SELECT * FROM Warning WHERE patient_ID = '504-86-182' AND measurement_timestamp > '1950-01-01';
	
-- 8) Make a new report for a patient

	INSERT INTO ReportInformation (patient_ID, date, typology, written_by, start_date, end_date, notes)
	VALUES ('504-86-182','2018-02-10 10:30','typology_example', 205, '2018-02-10', '2019-02-10', 'A short description about the report');

	-- The following insert is repeated for a variable number of columns (the number of physiological_parameters)	

	INSERT INTO ReportValues (patient_ID, date, typology, written_by, physiological_parameter, computed_value, measurement_unit)
	VALUES ('504-86-182','2018-02-10 10:30','typology_example', 205, 'my_first_parameter', 5.40 ,'kPA');


-- 9) Modify a report made by the technician for a patient (or remove)

	-- the technician's permissions for the update are checked at application level

	UPDATE ReportInformation SET notes = 'a new note'
	WHERE patient_ID = '504-86-182' AND date = '2018-02-10 10:30' AND typology = 'typology_example' AND written_by = 205;
	
	UPDATE ReportValues SET computed_value = 6
	WHERE patient_ID = '504-86-182' AND date = '2018-02-10 10:30' AND typology = 'typology_example' AND written_by = 205 AND physiological_parameter = 'my_first_parameter';


-- 10) Get the list of reports of a given patient in a given time period (both information and values)

	SELECT * FROM ReportInformation WHERE patient_ID = '504-86-182' AND date > '1955-02-01';
	SELECT * FROM ReportValues WHERE patient_ID = '504-86-182' AND date > '1955-02-01';

-- 11) Given the patient ID, get the list of all sensors connected to the patient 

	SELECT * FROM PatientSensors WHERE patient_ID = '800-98-474';

-- 12) Given the patient ID, get the list of all sensors connected to the patient of a given typology

	SELECT * FROM PatientSensors WHERE patient_ID = '800-98-474' AND sensor_typology = 'glucose';

-- 13) Given a sensor ID, get the list of all sensor’s measurements in a given time period

	SELECT * FROM Measurement WHERE sensor_serial_number = 1 AND timestamp >= '2010-02-01' ;

-- 14) Given a sensor ID, compute an aggregate value for the sensor’s measurements in a given time period  (max value, min value, avg value)

    SELECT MAX(value) as max_value, measurement_unit FROM Measurement WHERE sensor_serial_number = 1 AND timestamp >= '2010-02-01';
	
	SELECT MIN(value) as min_value, measurement_unit FROM Measurement WHERE sensor_serial_number = 1 AND timestamp >= '2010-02-01';
	
	SELECT AVG(value) as avg_value, measurement_unit FROM Measurement WHERE sensor_serial_number = 1 AND timestamp >= '2010-02-01';









