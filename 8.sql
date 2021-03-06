WITH deux AS (
SELECT AVG(mutation.val_fonc/bien.surface_car) AS prix
FROM mutation
INNER JOIN Bien ON bien.id = mutation.bien_id
INNER JOIN type_local ON type_local.code = bien.code_local
WHERE bien.piece_princip_nb=2
AND type_local.nom = 'Appartement'
)
, 
trois AS (
SELECT AVG(mutation.val_fonc/bien.surface_car) AS prix
FROM mutation
INNER JOIN Bien ON bien.id = mutation.bien_id
INNER JOIN type_local ON type_local.code = bien.code_local
WHERE bien.piece_princip_nb=3
AND type_local.nom = 'Appartement'
)

SELECT 
	CAST(deux.prix AS DECIMAL (10, 2)) AS "Prix (m²) 2 p",
	CAST(trois.prix AS DECIMAL (10, 2)) AS "Prix (m²) 3 p",
	CAST(
		ROUND(((trois.prix-deux.prix)*100/deux.prix), 2)
	AS DECIMAL(10, 2))
AS "Dif. prix (m²) 2 et 3 pièces"
FROM deux, trois

;