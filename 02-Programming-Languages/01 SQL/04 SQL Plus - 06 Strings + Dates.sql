
WITH cte_date AS (
SELECT delivery_day, TO_DATE(delivery_day, 'DD.MM.YYYY') AS iso_date
FROM shipment s
)
SELECT DISTINCT iso_date,
       EXTRACT(YEAR   FROM iso_date) AS year,
       EXTRACT(MONTH  FROM iso_date) AS month,
       EXTRACT(WEEK   FROM iso_date) AS week,
       EXTRACT(DAY    FROM iso_date) AS day,
       EXTRACT(DECADE FROM iso_date) AS decade
  FROM cte_date
  ORDER BY iso_date