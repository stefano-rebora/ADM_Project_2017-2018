

-- 1) Given the sensor ID, the value and the unit of the measurement and the measurement ‘s time stamp, insert a new measurement

	INSERT INTO Measurement (sensor_serial_number, timestamp, value, measurement_unit)
	VALUES (013, 1518456349, 3, 'kPA');