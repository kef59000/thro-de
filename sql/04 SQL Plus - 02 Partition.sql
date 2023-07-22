
SELECT delivery_day, plant, customer, gw_kg,
sum(gw_kg) OVER (PARTITION BY delivery_day, plant) AS sum_kg_plant
FROM shipment s;

SELECT k_name, 
count(typ) OVER (PARTITION BY typ) AS sum_kg_plant
FROM customer c;

CREATE VIEW v_shipment_all_details AS (
	SELECT p.id, c.grp, sum(s.gw_kg) as sum_gw
	FROM customer c
	INNER JOIN shipment s ON s.customer = c.id
	INNER JOIN plant p  ON s.plant = p.id
	GROUP BY p.id, c.grp
);	

SELECT *
FROM v_shipment_all_details
ORDER BY id, grp;


SELECT id, grp, sum_gw,
count(grp) OVER (PARTITION BY id) AS sum_kg_plant
FROM v_shipment_all_details;

SELECT distinct grp from customer c 