-- SENSOR WORKLOAD

USE adm_project;

-- For strong consistency

CONSISTENCY LOCAL_QUORUM;

-- 1) Given the sensor ID, the value and the unit of the measurement and the measurement‘s time stamp, insert a new measurement

	INSERT INTO Measurement (sensor_serial_number, timestamp, value, measurement_unit) VALUES (13, '2018-02-13 10:31:47', 3, 'kPA');
