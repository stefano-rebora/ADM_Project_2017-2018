USE adm_project;

COPY Doctor (doctor_ID,password,name,surname,date_of_birth,specialization) FROM '../datasets/doctors_dataset.csv' WITH HEADER=TRUE;

COPY LaboratoryTechnician (technician_ID,password,name,surname,date_of_birth,laboratory_code) FROM '../datasets/technicians_dataset.csv' WITH HEADER=TRUE;

COPY Treatment (patient_ID,start_date,typology,end_date,prescribed_by,description,date_of_prescription) FROM '../datasets/treatments_dataset_1.csv' WITH HEADER=TRUE;

COPY Treatment (patient_ID,start_date,typology,end_date,prescribed_by,description,date_of_prescription) FROM '../datasets/treatments_dataset_2.csv' WITH HEADER=TRUE;

COPY ProfileInformation (patient_ID,typology,prepared_by,date,description) FROM '../datasets/profileInformations_dataset_1.csv' WITH HEADER=TRUE;

COPY ProfileInformation (patient_ID,typology,prepared_by,date,description) FROM '../datasets/profileInformations_dataset_2.csv' WITH HEADER=TRUE;

COPY ProfileInformation (patient_ID,typology,prepared_by,date,description) FROM '../datasets/profileInformations_dataset_3.csv' WITH HEADER=TRUE;

COPY ProfileInformation (patient_ID,typology,prepared_by,date,description) FROM '../datasets/profileInformations_dataset_4.csv' WITH HEADER=TRUE;

COPY ProfileRecommendedValues (patient_ID,typology,physiological_parameter,min_recommended_value,max_recommended_value,measurement_unit) FROM '../datasets/profile_recommended_values_dataset_1.csv' WITH HEADER=TRUE;

COPY ProfileRecommendedValues (patient_ID,typology,physiological_parameter,min_recommended_value,max_recommended_value,measurement_unit) FROM '../datasets/profile_recommended_values_dataset_2.csv' WITH HEADER=TRUE;

COPY ProfileRecommendedValues (patient_ID,typology,physiological_parameter,min_recommended_value,max_recommended_value,measurement_unit) FROM '../datasets/profile_recommended_values_dataset_3.csv' WITH HEADER=TRUE;

COPY ProfileRecommendedValues (patient_ID,typology,physiological_parameter,min_recommended_value,max_recommended_value,measurement_unit) FROM '../datasets/profile_recommended_values_dataset_4.csv' WITH HEADER=TRUE;

COPY Patient (patient_health_code,password,name,surname,date_of_birth,telephone_number,home_address) FROM '../datasets/patients_dataset.csv' WITH HEADER=TRUE;

COPY PatientSensors (patient_ID,sensor_typology,sensor_serial_number) FROM '../datasets/patientsensors_dataset.csv' WITH HEADER=TRUE;

COPY Warning (patient_ID,measurement_timestamp,profile_typology,sensor_serial_number,measurement_value,warning_timestamp) FROM '../datasets/warning_dataset.csv' WITH HEADER=TRUE;

COPY ReportInformation (patient_ID,date,typology,written_by,start_date,end_date,notes) FROM '../datasets/reportsInformation_dataset_1.csv' WITH HEADER=TRUE;

COPY ReportInformation (patient_ID,date,typology,written_by,start_date,end_date,notes) FROM '../datasets/reportsInformation_dataset_2.csv' WITH HEADER=TRUE;

COPY ReportValues (patient_ID,date,typology,written_by,physiological_parameter,computed_value,measurement_unit) FROM '../datasets/report_values_dataset.csv' WITH HEADER=TRUE;

COPY Sensor (sensor_serial_number,typology,description) FROM '../datasets/sensors_dataset.csv' WITH HEADER=TRUE;

COPY Measurement (sensor_serial_number,timestamp,value,measurement_unit) FROM '../datasets/measurements_dataset_1.csv' WITH HEADER=TRUE;

COPY Measurement (sensor_serial_number,timestamp,value,measurement_unit) FROM '../datasets/measurements_dataset_2.csv' WITH HEADER=TRUE;

COPY Measurement (sensor_serial_number,timestamp,value,measurement_unit) FROM '../datasets/measurements_dataset_3.csv' WITH HEADER=TRUE;

COPY Measurement (sensor_serial_number,timestamp,value,measurement_unit) FROM '../datasets/measurements_dataset_4.csv' WITH HEADER=TRUE;

COPY Measurement (sensor_serial_number,timestamp,value,measurement_unit) FROM '../datasets/measurements_dataset_5.csv' WITH HEADER=TRUE;

COPY Measurement (sensor_serial_number,timestamp,value,measurement_unit) FROM '../datasets/measurements_dataset_6.csv' WITH HEADER=TRUE;

COPY Measurement (sensor_serial_number,timestamp,value,measurement_unit) FROM '../datasets/measurements_dataset_7.csv' WITH HEADER=TRUE;