-- DOCTOR WORKLOAD

USE adm_project;

-- For strong consistency

CONSISTENCY LOCAL_QUORUM;

-- 1) Given all the doctor’s information, create a unique account for a doctor (or remove)

	INSERT INTO Doctor (doctor_ID, password, name, surname, date_of_birth, specialization)
	VALUES (201,'example_password', 'Andrea', 'Rossi', 19901212, 'Orthopedic') IF NOT EXISTS;
  	
  	
  	DELETE FROM Doctor WHERE doctor_ID = 201 ;
  	
-- 2) Log in, given the doctor ID and the current password

-- The password validity is check at application level

	SELECT * FROM Doctor WHERE doctor_ID = 23 ;
	

-- 3) Change the password, given the doctor ID, the old password and the new one

-- The old password validity is check at application level as query 2)

	UPDATE Doctor SET password = 'new_password' WHERE doctor_ID = 11 ;

-- 4) Given the doctor ID, visualize the doctor’s account information

	SELECT * FROM Doctor WHERE doctor_ID = 11;

-- 5) Given a patient ID, visualize the patient’s account information

	SELECT * FROM Patient WHERE patient_health_code = '504-86-182';

-- 6) Prescribe a treatment, given a patient ID

	INSERT INTO Treatment (patient_ID, start_date, typology, end_date, prescribed_by, description, date_of_prescription)
	VALUES ('504-86-182', '2018-02-11', 'typology_example', '2018-04-11', 11, 'A short description about the treatment', '2018-02-10');

-- 7) Modify a treatment prescribed by the doctor for a given patient ID (or remove)

-- we assume that the update statement is executed by the application level only if the treatment is written by the doctor who performs the update
-- for example , we can execute the query 8) and then allow the update only on the result of the previous query

	UPDATE Treatment SET description = 'a new description', date_of_prescription = '2018-02-12'
	WHERE patient_ID = '504-86-182' AND start_date ='2018-02-11' AND typology = 'typology_example';
	
	DELETE FROM Treatment WHERE patient_ID = '504-86-182' AND start_date ='2018-02-11' AND typology = 'typology_example';
	
-- 8) Given a patient ID, get the list of all treatments prescribed to the patient by the doctor in a given time period

-- as time period, we assume that we are interested in treatments whose start_date is greater than a given value

	SELECT * FROM Treatment WHERE patient_ID = '504-86-182' AND start_date >= '2017-01-01' AND prescribed_by = 11;
	
	
-- 9) Given a patient ID, get the list of all treatments that the patient has to follow in a given time period

	SELECT * FROM Treatment WHERE patient_ID = '504-86-182' AND start_date >= '2017-01-01' ;
	
-- 10) Given a patient ID, get the list of all treatments of a specific typology that the patient has to follow in a given time period

--  we apply the query 9) and then the filter on typology is applied at application level

    SELECT * FROM Treatment WHERE patient_ID = '504-86-182' AND start_date >= '2017-01-01' ;
	
-- beacause the following query cannot be executed in cassandra with our schema 
-- SELECT * FROM Treatment WHERE patient_ID = '504-86-182' AND start_date >= '2001-01-01' AND typology = 'Cardiological';

-- 11) Make a profile for a patient 

    INSERT INTO ProfileInformation (patient_ID, typology, prepared_by, date, description)
	VALUES ('504-86-182','typology_example', 11,'2018-01-01', 'A short description about the profile');
	
-- The following insert is repeated for a variable number of columns ( the number of physiological_parameters)	
	INSERT INTO ProfileRecommendedValues (patient_ID, typology, physiological_parameter, min_recommended_value, max_recommended_value, measurement_unit)
	VALUES ('504-86-182','typology_example', 'my_first_parameter',5,10 ,'kPA');
 
-- 12) Modify a patient’s profile made by the doctor (or remove)

-- the doctor's permissions for the update are checked at application level

    UPDATE ProfileInformation SET description = 'a new description' WHERE patient_ID = '504-86-182' AND typology = 'typology_example';
	
	UPDATE ProfileRecommendedValues SET min_recommended_value = 7 WHERE patient_ID = '504-86-182' AND typology = 'typology_example' AND physiological_parameter = 'my_first_parameter';


-- 13) Get the list of all profiles of a patient (both information and values)

    SELECT * FROM ProfileInformation WHERE patient_ID = '504-86-182';
	SELECT * FROM ProfileRecommendedValues WHERE patient_ID = '504-86-182';


-- 14) Get the list of warnings of a given patient in a given time period

-- as time period, we assume that we are interested in warning whose measurement_timestamp is greater than a given value

    SELECT * FROM Warning WHERE patient_ID = '504-86-182' AND measurement_timestamp > '1950-01-01';
	
-- 15) Get the list of reports of a given patient in a given time period ( both information and values)

    SELECT * FROM ReportInformation WHERE patient_ID = '504-86-182' AND date > '1950-01-01';
	SELECT * FROM ReportValues WHERE patient_ID = '504-86-182' AND date > '1950-01-01';

