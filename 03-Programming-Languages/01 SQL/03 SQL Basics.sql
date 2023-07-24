-- 01) Show all plants
SELECT *
FROM plant;


-- 02) Show all custome names, street addresses, zip cides, and locations
SELECT k_name, strasse, plz, ort 
FROM customer;


-- 03 Show all outlet customers
SELECT k_name, strasse, plz, ort
FROM customer
WHERE art = 'Outlet';


-- 04) Order Query 3 as a function of the zip code
SELECT *
FROM (
	SELECT k_name, strasse, plz, ort
	FROM customer
	WHERE art = 'Outlet') as tab_1
ORDER BY plz ASC;


-- 05) What is the overall volume delivered (in tons)?
SELECT sum(gw_kg)/1000 AS tons
FROM shipment;


-- 06) What is the overall tonnage delivered by the single plants?
SELECT plant, sum(gw_kg)/1000 AS tons
FROM shipment
GROUP BY plant;


-- 07 What was the minimum, average and maximum shipment weight per plant and tariff group?
SELECT plant, tt_2, min(pallets) AS pal_min, avg(pallets) AS pal_avg, max(pallets) AS pal_max 
FROM shipment
GROUP BY plant, tt_2;


-- 08) On which days was it delivered?
SELECT Distinct delivery_day 
FROM shipment;


-- 09) On how many days was it delivered?
SELECT count(*) As nb_of_days
FROM (
	SELECT Distinct delivery_day
	FROM shipment) as tab_1;


-- 10) To which postal code were the individual shipments delivered?
SELECT shipment.id, customer.plz 
FROM shipment
INNER JOIN customer
ON shipment.customer = customer.id;


-- 11) How many tons of FMCG were delivered to each postal code?
SELECT customer.plz, sum(shipment.gw_kg) As sum_kg
FROM shipment
INNER JOIN customer
ON shipment.customer = customer.id
GROUP BY customer.plz;


-- 12) How many tons of FMCG were delivered from which postal code to which postal code?
SELECT plant.plz, customer.plz, sum(shipment.gw_kg) As sum_kg
FROM plant
INNER JOIN (
	shipment
	INNER JOIN customer
	ON shipment.customer = customer.id)
ON plant.id = shipment.plant
GROUP BY plant.plz, customer.plz;


-- 13) How many KG FMCG were delivered to customer 10099192 on each day?
SELECT tab_1.delivery_day, tab_2.weight
FROM (
	SELECT Distinct delivery_day
	FROM shipment) as tab_1
LEFT JOIN (
	SELECT delivery_day, sum(gw_kg) As weight
	FROM shipment
	WHERE customer = 10099192
	GROUP BY delivery_day) as tab_2
ON tab_1.delivery_day = tab_2.delivery_day
ORDER BY tab_1.delivery_day;
