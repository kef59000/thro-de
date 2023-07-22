
SELECT plant, sum(gw_kg) AS sum_kg
FROM shipment s 
WHERE plant = 'DE12'
GROUP BY plant
UNION
SELECT plant, sum(gw_kg) AS sum_kg
FROM shipment s 
WHERE plant = 'DE14'
GROUP BY plant
UNION
SELECT plant, sum(gw_kg) AS sum_kg
FROM shipment s 
WHERE plant = 'DE17'
GROUP BY plant;

SELECT plant, sum(gw_kg) AS sum_kg
FROM shipment s 
GROUP BY plant;