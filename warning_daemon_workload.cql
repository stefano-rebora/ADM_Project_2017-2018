-- WARNING DAEMON WORKLOAD

-- 1) Given a sensor ID, get the associated patient ID
       
   
-- 2) Given a patient ID, get the list of all patient’s profiles ( only recommended values)

    
-- 3) Given a patient’s profile and a measurement, insert a new warning


-- 4) Given a patient ID, remove all patient’s warnings in a given time period (periodical garbage collector)

    DELETE FROM Warning WHERE patient_ID = '504-86-182' AND 
    
    #data misurazione o data generazione warning? meglio misurazione almeno è clustering column?
