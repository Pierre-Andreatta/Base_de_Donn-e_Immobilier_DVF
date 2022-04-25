SELECT 
CAST(
	ROUND(AVG(mutation.val_fonc/bien.surface_car), 2)
AS DECIMAL(12, 2)
)

AS "prix au m²"

FROM mutation

INNER JOIN bien ON bien.id = mutation.bien_id
INNER JOIN commune ON commune.code_id =  bien.commune_code_id
INNER JOIN type_local ON type_local.code = bien.code_local

WHERE type_local.nom = 'Maison'
AND  commune.code_dep in ('75', '77', '78', '91', '92', '93', '94', '95')

;