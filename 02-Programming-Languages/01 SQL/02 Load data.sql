COPY customer
FROM '/csv_data/customer.csv' 
DELIMITER ';' 
CSV HEADER
ENCODING 'LATIN1';


COPY plant
FROM '/csv_data/plant.csv' 
DELIMITER ';' 
CSV HEADER
ENCODING 'LATIN1';


COPY shipment
FROM '/csv_data/shipment.csv' 
DELIMITER ';' 
CSV HEADER
ENCODING 'LATIN1';
