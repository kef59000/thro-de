
SELECT DISTINCT id,
CASE id
	WHEN 'DE12' THEN 'Plant 12'
    WHEN 'DE14' THEN 'Plant 14'
    ELSE 'Plant 17'
END plant_description
FROM plant p 
;