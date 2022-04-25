SELECT 
	commune.code_dep AS "Département",
	bien.id AS "Bien",
	bien.surface_car AS "m²",
	mutation.val_fonc AS "Prix"

FROM mutation

INNER JOIN bien ON bien.id = mutation.bien_id
INNER JOIN commune ON commune.code_id = bien.commune_code_id
INNER JOIN type_local ON type_local.code = bien.code_local

WHERE type_local.nom = 'Appartement'
ORDER BY "Prix" DESC

LIMIT 10
;