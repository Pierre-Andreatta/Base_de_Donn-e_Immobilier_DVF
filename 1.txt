SELECT 
	type_local.nom AS "Type de bien", 
	COUNT(mutation.bien_id) AS "Nombre"

FROM mutation

JOIN bien ON bien.id = mutation.bien_id
JOIN type_local ON type_local.code = bien.code_local

WHERE type_local.nom = 'Appartement'
AND mutation.nature_id = 1
AND mutation.date BETWEEN '2020-01-01' AND '2020-03-31'

GROUP BY type_local.nom
;