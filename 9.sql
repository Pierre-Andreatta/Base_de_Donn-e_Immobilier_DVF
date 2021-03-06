WITH dep AS (
SELECT commune.code_dep AS departement, COUNT(mutation.id) AS nb_ventes, AVG(mutation.val_fonc/bien.surface_car) AS prix_m
FROM mutation
INNER JOIN bien ON bien.id = mutation.bien_id
INNER JOIN commune ON commune.code_id = bien.commune_code_id
INNER JOIN type_local ON type_local.code = bien.code_local
WHERE type_local.nom = 'Appartement'
GROUP BY commune.code_dep
)
,
ventes AS (
SELECT commune.code_dep AS departement, mutation.id AS mutation_id, mutation.val_fonc/bien.surface_car AS prix
FROM mutation
INNER JOIN bien ON bien.id = mutation.bien_id
INNER JOIN commune ON commune.code_id = bien.commune_code_id
INNER JOIN type_local ON type_local.code = bien.code_local
WHERE type_local.nom = 'Appartement'
)

SELECT 
	ventes.departement AS departement,
	CAST(AVG(dep.prix_m) AS DECIMAL(10, 2))AS "Prix moyen au m²",
	AVG(dep.nb_ventes) AS "Nombre d'appartements vendus dans le département", 
	COUNT(ventes.mutation_id) AS "Nombre d'appartement vendus deux fois plus cher", 
	CAST(
		ROUND(
			(COUNT(ventes.mutation_id)/AVG(dep.nb_ventes))*100
		, 2)
	AS DECIMAL(10, 2)) AS Taux
	
FROM ventes
LEFT JOIN dep ON dep.departement = ventes.departement
WHERE ventes.prix>2*dep.prix_m
GROUP BY ventes.departement
ORDER BY Taux DESC

; 