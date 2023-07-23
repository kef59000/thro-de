
SELECT delivery_day, plant, customer, gw_kg,
sum(gw_kg) OVER (PARTITION BY delivery_day, plant) AS sum_kg_plant
FROM shipment s;


CREATE VIEW v_plant_grp_gw AS (
	SELECT s.plant, c.grp, sum(s.gw_kg) as sum_gw
	FROM customer c
	INNER JOIN shipment s ON s.customer = c.id
	GROUP BY s.plant, c.grp
);

SELECT * FROM v_plant_grp_gw;

SELECT plant, grp, sum_gw,
count(grp) OVER (PARTITION BY plant) AS grp_per_plant,
sum(sum_gw) OVER (PARTITION BY plant) AS sum_per_plant,
sum(sum_gw) OVER (PARTITION BY plant ORDER BY sum_gw) AS cumul_sum,
ROW_NUMBER() OVER (PARTITION BY plant) AS row_nb,
RANK() OVER (ORDER BY sum_gw DESC) AS rank,
DENSE_RANK() OVER (ORDER BY sum_gw DESC) AS dense_rank,
LAG(sum_gw, 1) OVER (PARTITION BY plant ORDER BY sum_gw) AS lag,
LEAD(sum_gw, 1) OVER  (PARTITION BY plant ORDER BY sum_gw) AS lead,
NTILE(4) OVER (PARTITION BY plant ORDER BY sum_gw) AS quartile
FROM v_plant_grp_gw;

