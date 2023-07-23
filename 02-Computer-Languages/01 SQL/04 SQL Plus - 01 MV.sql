
-- Task 1 ----------------------------------------------------------------
-- View
CREATE VIEW v_customer_shipment AS (
	SELECT c.plz, sum(s.gw_kg) AS sum_gw
	FROM shipment s
	INNER JOIN customer c
	ON s.customer = c.id
	GROUP BY c.plz
);

-- MVIEW
CREATE MATERIALIZED VIEW mv_customer_shipment AS (
	SELECT c.plz, sum(s.gw_kg) AS sum_gw
	FROM shipment s
	INNER JOIN customer c
	ON s.customer = c.id
	GROUP BY c.plz
);

SELECT * FROM v_customer_shipment LIMIT 200;
SELECT * FROM mv_customer_shipment LIMIT 200;


-- Task 2 ----------------------------------------------------------------
DROP TABLE IF EXISTS customer_copy;
CREATE TABLE customer_copy AS (SELECT * FROM customer);
SELECT COUNT(*) FROM customer_copy;

DELETE FROM customer;
SELECT COUNT(*) FROM customer;

SELECT * FROM v_customer_shipment LIMIT 200;
SELECT * FROM mv_customer_shipment LIMIT 200;

REFRESH MATERIALIZED VIEW mv_customer_shipment;

SELECT * FROM v_customer_shipment LIMIT 200;
SELECT * FROM mv_customer_shipment LIMIT 200;

INSERT INTO customer SELECT * FROM customer_copy;

REFRESH MATERIALIZED VIEW mv_customer_shipment;

SELECT * FROM v_customer_shipment LIMIT 200;
SELECT * FROM mv_customer_shipment LIMIT 200;


-- Task 3 ----------------------------------------------------------------
CREATE VIEW v_customer_shipment_plant AS (
	SELECT p.plz as p_plz, c.plz as c_plz, sum(s.gw_kg) AS sum_gw
	FROM plant p
	INNER JOIN (shipment s INNER JOIN customer c ON s.customer = c.id)
	ON p.id = s.plant
	WHERE p.id = 'DE12'
	GROUP BY p.plz, c.plz
);

CREATE MATERIALIZED VIEW mv_customer_shipment_pid AS (
	SELECT c.plz as c_plz, s.plant, sum(s.gw_kg) AS sum_gw
	FROM shipment s
	INNER JOIN customer c
	ON s.customer = c.id
	GROUP BY c.plz, s.plant
);

SELECT * FROM mv_customer_shipment_pid;

CREATE VIEW v_mv_customer_shipment_plant AS (
	SELECT p.plz as p_plz, mv.c_plz as c_plz, sum(mv.sum_gw) AS sum_gw
	FROM plant p
	INNER JOIN mv_customer_shipment_pid mv
	ON p.id = mv.plant
	WHERE p.id = 'DE12'
	GROUP BY p.plz, mv.c_plz
);

CREATE MATERIALIZED VIEW mv_customer_shipment_plant AS (
	SELECT p.plz as p_plz, c.plz as c_plz, sum(s.gw_kg) AS sum_gw
	FROM plant p
	INNER JOIN (shipment s INNER JOIN customer c ON s.customer = c.id)
	ON p.id = s.plant
	WHERE p.id = 'DE12'
	GROUP BY p.plz, c.plz
);

SELECT * FROM v_customer_shipment_plant LIMIT 200;
SELECT * FROM v_mv_customer_shipment_plant LIMIT 200;
SELECT * FROM mv_customer_shipment_plant LIMIT 200;

