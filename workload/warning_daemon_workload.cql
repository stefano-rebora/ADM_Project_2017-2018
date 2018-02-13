-- WARNING DAEMON WORKLOAD

USE adm_project;

-- For strong consistency

CONSISTENCY LOCAL_QUORUM;

-- 1) Given a sensor ID, get the associated patient ID

    SELECT patient_ID FROM PatientSensors WHERE sensor_serial_number = 610;
   
-- 2) Given a patient ID, get the list of all patient’s profiles ( only recommended values)

    SELECT * FROM ProfileRecommendedValues WHERE patient_ID = '520-19-458';
	
    
-- 3) Given a patient’s profile and a measurement, insert a new warning

    INSERT INTO Warning (patient_ID, measurement_timestamp, profile_typology, sensor_serial_number, measurement_value, warning_timestamp)
	VALUES ('520-19-458', '2016-09-26 05:37:07', 'diabetologist', 610, 412.55, '2016-09-26 06:00:00');


-- 4) Given a patient ID, remove all patient’s warnings in a given time period (periodical garbage collector)

    DELETE FROM Warning WHERE patient_ID = '520-19-458' AND measurement_timestamp <= '2010-01-01'; 
    
