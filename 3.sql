SELECT commune.code_dep AS "Département", 
Cast(
	ROUND(AVG(mutation.val_fonc/bien.surface_car), 2) 
AS DECIMAL(10, 2))
AS "prix au m²"
FROM mutation

INNER JOIN bien ON bien.id = mutation.bien_id
INNER JOIN commune ON commune.code_id = bien.commune_code_id

GROUP BY commune.code_dep
ORDER BY "prix au m²" DESC

LIMIT 10
;